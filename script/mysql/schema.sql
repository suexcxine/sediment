CREATE TABLE `notebooks` (
      `id` bigint(10) UNSIGNED NOT NULL,
      `parent_id` bigint(10) UNSIGNED NOT NULL COMMENT '父结点id',
      `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '笔记本名称',
      `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='笔记本表';

ALTER TABLE `notebooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`) USING HASH,
  ADD KEY `name` (`name`) USING HASH;


CREATE TABLE `notes` (
      `id` bigint(20) UNSIGNED NOT NULL,
      `notebook_id` bigint(20) UNSIGNED NOT NULL COMMENT '所属笔记本id',
      `name` varchar(60) NOT NULL COMMENT '笔记名称',
      `summary` longtext NOT NULL COMMENT '笔记总结',
      `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='笔记表';

ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notebook_id` (`notebook_id`) USING HASH,
  ADD KEY `name` (`name`) USING HASH;

CREATE TABLE `task` (
      `id` bigint(20) UNSIGNED NOT NULL,
      `note_id` bigint(20) UNSIGNED NOT NULL COMMENT '所属笔记id',
      `name` varchar(150) NOT NULL COMMENT '任务名称',
      `content` text NOT NULL COMMENT '内容',
      `priority` tinyint(3) UNSIGNED NOT NULL COMMENT '优先级',
      `deadline` datetime NOT NULL COMMENT '截止日期时间戳',
      `finished_on` datetime NOT NULL,
      `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_id` (`note_id`) USING HASH,
  ADD KEY `name` (`name`) USING HASH,
  ADD KEY `deadline` (`deadline`),
  ADD KEY `priority` (`priority`);

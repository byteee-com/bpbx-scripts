/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022 (8.0.22)
 Source Host           : localhost:3306
 Source Schema         : test-asterisk

 Target Server Type    : MySQL
 Target Server Version : 80022 (8.0.22)
 File Encoding         : 65001

 Date: 04/03/2024 14:30:02
*/

-- SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
BEGIN;
INSERT INTO `alembic_version` (`version_num`) VALUES ('39428242f7f5');
INSERT INTO `alembic_version` (`version_num`) VALUES ('54cde9847798');
INSERT INTO `alembic_version` (`version_num`) VALUES ('ccf795ee535f');
COMMIT;

-- ----------------------------
-- Table structure for cdr
-- ----------------------------
DROP TABLE IF EXISTS `cdr`;
CREATE TABLE `cdr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accountcode` varchar(80) DEFAULT NULL,
  `src` varchar(80) DEFAULT NULL,
  `dst` varchar(80) DEFAULT NULL,
  `dcontext` varchar(80) DEFAULT NULL,
  `clid` varchar(80) DEFAULT NULL,
  `channel` varchar(80) DEFAULT NULL,
  `dstchannel` varchar(80) DEFAULT NULL,
  `lastapp` varchar(80) DEFAULT NULL,
  `lastdata` varchar(80) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `answer` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `billsec` int DEFAULT NULL,
  `disposition` varchar(45) DEFAULT NULL,
  `amaflags` varchar(45) DEFAULT NULL,
  `userfield` varchar(256) DEFAULT NULL,
  `uniqueid` varchar(150) DEFAULT NULL,
  `linkedid` varchar(150) DEFAULT NULL,
  `peeraccount` varchar(80) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
   PRIMARY KEY (`id`),
) ENGINE=InnoDB;

-- ----------------------------
-- Records of cdr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extensions
-- ----------------------------
DROP TABLE IF EXISTS `extensions`;
CREATE TABLE `extensions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context` (`context`,`exten`,`priority`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of extensions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for iaxpeers
-- ----------------------------
DROP TABLE IF EXISTS `iaxpeers`;
CREATE TABLE `iaxpeers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `iaxpeers_name` (`name`),
  KEY `iaxpeers_name_host` (`name`,`host`),
  KEY `iaxpeers_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  KEY `iaxpeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `iaxpeers_host_port` (`host`,`port`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of iaxpeers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for meetme
-- ----------------------------
DROP TABLE IF EXISTS `meetme`;
CREATE TABLE `meetme` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int DEFAULT NULL,
  `members` int NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of meetme
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for musiconhold
-- ----------------------------
DROP TABLE IF EXISTS `musiconhold`;
CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3','playlist') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of musiconhold
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for musiconhold_entry
-- ----------------------------
DROP TABLE IF EXISTS `musiconhold_entry`;
CREATE TABLE `musiconhold_entry` (
  `name` varchar(80) NOT NULL,
  `position` int NOT NULL,
  `entry` varchar(1024) NOT NULL,
  PRIMARY KEY (`name`,`position`),
  CONSTRAINT `fk_musiconhold_entry_name_musiconhold` FOREIGN KEY (`name`) REFERENCES `musiconhold` (`name`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of musiconhold_entry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_aors
-- ----------------------------
DROP TABLE IF EXISTS `ps_aors`;
CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int DEFAULT NULL,
  `minimum_expiration` int DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `remove_unavailable` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_aors
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_asterisk_publications
-- ----------------------------
DROP TABLE IF EXISTS `ps_asterisk_publications`;
CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_asterisk_publications_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_asterisk_publications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_auths
-- ----------------------------
DROP TABLE IF EXISTS `ps_auths`;
CREATE TABLE `ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_auths
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_contacts
-- ----------------------------
DROP TABLE IF EXISTS `ps_contacts`;
CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(511) DEFAULT NULL,
  `expiration_time` bigint DEFAULT NULL,
  `qualify_frequency` int DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(255) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_contacts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_domain_aliases
-- ----------------------------
DROP TABLE IF EXISTS `ps_domain_aliases`;
CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_domain_aliases
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_endpoint_id_ips
-- ----------------------------
DROP TABLE IF EXISTS `ps_endpoint_id_ips`;
CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_endpoint_id_ips
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_endpoints
-- ----------------------------
DROP TABLE IF EXISTS `ps_endpoints`;
CREATE TABLE `ps_endpoints` (
  `id` varchar(40) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','peer_supported','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int DEFAULT NULL,
  `cos_video` int DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int DEFAULT NULL,
  `rtp_timeout` int DEFAULT NULL,
  `rtp_timeout_hold` int DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int DEFAULT NULL,
  `max_video_streams` int DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_history_info` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `stir_shaken` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `allow_unauthenticated_options` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `t38_bind_udptl_to_media_address` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `geoloc_incoming_call_profile` varchar(80) DEFAULT NULL,
  `geoloc_outgoing_call_profile` varchar(80) DEFAULT NULL,
  `stir_shaken_profile` varchar(80) DEFAULT NULL,
  `security_negotiation` enum('no','mediasec') DEFAULT NULL,
  `security_mechanisms` varchar(512) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_endpoints
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_globals
-- ----------------------------
DROP TABLE IF EXISTS `ps_globals`;
CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int DEFAULT NULL,
  `unidentified_request_period` int DEFAULT NULL,
  `unidentified_request_prune_interval` int DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int DEFAULT NULL,
  `mwi_tps_queue_low` int DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  `use_callerid_contact` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_contact_status_on_update_registration` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `taskprocessor_overload_trigger` enum('none','global','pjsip_only') DEFAULT NULL,
  `norefersub` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `allow_sending_180_after_183` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `all_codecs_on_empty_reinvite` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_globals
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_inbound_publications
-- ----------------------------
DROP TABLE IF EXISTS `ps_inbound_publications`;
CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_inbound_publications_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_inbound_publications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_outbound_publishes
-- ----------------------------
DROP TABLE IF EXISTS `ps_outbound_publishes`;
CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_outbound_publishes_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_outbound_publishes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_registrations
-- ----------------------------
DROP TABLE IF EXISTS `ps_registrations`;
CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int DEFAULT NULL,
  `max_retries` int DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int DEFAULT NULL,
  `forbidden_retry_interval` int DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `max_random_initial_delay` int DEFAULT NULL,
  `security_negotiation` enum('no','mediasec') DEFAULT NULL,
  `security_mechanisms` varchar(512) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_registrations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_resource_list
-- ----------------------------
DROP TABLE IF EXISTS `ps_resource_list`;
CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int DEFAULT NULL,
  `resource_display_name` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_resource_list_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_resource_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_subscription_persistence
-- ----------------------------
DROP TABLE IF EXISTS `ps_subscription_persistence`;
CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int DEFAULT NULL,
  `cseq` int DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_subscription_persistence
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_systems
-- ----------------------------
DROP TABLE IF EXISTS `ps_systems`;
CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int DEFAULT NULL,
  `timer_b` int DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int DEFAULT NULL,
  `threadpool_auto_increment` int DEFAULT NULL,
  `threadpool_idle_timeout` int DEFAULT NULL,
  `threadpool_max_size` int DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `disable_rport` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_systems
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ps_transports
-- ----------------------------
DROP TABLE IF EXISTS `ps_transports`;
CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL,
  `allow_wildcard_certs` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of ps_transports
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for queue_members
-- ----------------------------
DROP TABLE IF EXISTS `queue_members`;
CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int DEFAULT NULL,
  `paused` int DEFAULT NULL,
  `uniqueid` int NOT NULL AUTO_INCREMENT,
  `wrapuptime` int DEFAULT NULL,
  `ringinuse` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  PRIMARY KEY (`queue_name`,`interface`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of queue_members
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for queue_rules
-- ----------------------------
DROP TABLE IF EXISTS `queue_rules`;
CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB;

-- ----------------------------
-- Records of queue_rules
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for queues
-- ----------------------------
DROP TABLE IF EXISTS `queues`;
CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int DEFAULT NULL,
  `announce_round_seconds` int DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int DEFAULT NULL,
  `wrapuptime` int DEFAULT NULL,
  `penaltymemberslimit` int DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int DEFAULT NULL,
  `servicelevel` int DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of queues
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sippeers
-- ----------------------------
DROP TABLE IF EXISTS `sippeers`;
CREATE TABLE `sippeers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `regseconds` int DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int DEFAULT NULL,
  `session-minse` int DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int DEFAULT NULL,
  `rtpholdtimeout` int DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int DEFAULT NULL,
  `timerb` int DEFAULT NULL,
  `qualifyfreq` int DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int DEFAULT NULL,
  `call-limit` int DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sippeers_name` (`name`),
  KEY `sippeers_name_host` (`name`,`host`),
  KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `sippeers_host_port` (`host`,`port`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of sippeers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for voicemail
-- ----------------------------
DROP TABLE IF EXISTS `voicemail`;
CREATE TABLE `voicemail` (
  `uniqueid` int NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `voicemail_mailbox` (`mailbox`),
  KEY `voicemail_context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of voicemail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for voicemail_messages
-- ----------------------------
DROP TABLE IF EXISTS `voicemail_messages`;
CREATE TABLE `voicemail_messages` (
  `dir` varchar(255) NOT NULL,
  `msgnum` int NOT NULL,
  `context` varchar(80) DEFAULT NULL,
  `macrocontext` varchar(80) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `origtime` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `recording` longblob,
  `flag` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `mailboxuser` varchar(30) DEFAULT NULL,
  `mailboxcontext` varchar(30) DEFAULT NULL,
  `msg_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dir`,`msgnum`),
  KEY `voicemail_messages_dir` (`dir`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of voicemail_messages
-- ----------------------------
BEGIN;
COMMIT;


DROP TABLE IF EXISTS `cel`;
CREATE TABLE `cel` (
  `id` int(11) NOT NULL auto_increment,
    `eventtype` varchar(30) NOT NULL,
    `eventtime` datetime NOT NULL,
    `cid_name` varchar(80) NOT NULL,
    `cid_num` varchar(80) NOT NULL,
    `cid_ani` varchar(80) NOT NULL,
    `cid_rdnis` varchar(80) NOT NULL,
    `cid_dnid` varchar(80) NOT NULL,
    `exten` varchar(80) NOT NULL,
    `context` varchar(80) NOT NULL,
    `channame` varchar(80) NOT NULL,
    `src` varchar(80) NULL,
    `dst` varchar(80) NULL,
    `channel` varchar(80) NULL,
    `dstchannel` varchar(80) NULL,
    `appname` varchar(80) NOT NULL,
    `appdata` varchar(80) NOT NULL,
    `amaflags` int(11) NOT NULL,
    `accountcode` varchar(20) NOT NULL,
    `uniqueid` varchar(32) NOT NULL,
    `linkedid` varchar(32) NOT NULL,
    `peer` varchar(255) NOT NULL,
    `userdeftype` varchar(255) NOT NULL,
    `eventextra` varchar(255)  NULL,
    `userfield` varchar(255) NOT NULL,
    PRIMARY KEY  (`id`),
    KEY `uniqueid_index` (`uniqueid`),
    KEY `linkedid_index` (`linkedid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of voicemail_messages
-- ----------------------------
BEGIN;
COMMIT;



INSERT INTO `bpbx`.`user` (`id`, `name`, `password`, `username`) VALUES (6, NULL, '$2a$10$.rW3MLTvv2cGBFOfClDy0.S816TJthjsPi3Rgeg2fJ1olkfc4A6ZS', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
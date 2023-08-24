Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A38A787A8E
	for <lists+linux-clk@lfdr.de>; Thu, 24 Aug 2023 23:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243729AbjHXVcQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 24 Aug 2023 17:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243733AbjHXVbw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 17:31:52 -0400
Received: from out-13.mta0.migadu.com (out-13.mta0.migadu.com [91.218.175.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EF91BD8
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 14:31:45 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692912703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SqITXHDOXnzQpnui3VuQnQCXc6cNaF0KKZOuevEqKWI=;
        b=Pk5C+JfDdC0UeWkm16sxxYklb5Ye/cEjV490spU9N0RUGvUJPtVoIru/SMbJ95ZGgnibz+
        FBa6hUpx3IuYCMkmXMe0EG+lV1B4+lAK+7dZu9qYrN0fqhkuR5M18vdAsKbxSi+mKrZXny
        LO32pH2tOY7nllxZz7eRdoRzfqej5tI=
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
To:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
Subject: [PATCH net-next v7 6/9] ice: add admin commands to access cgu configuration
Date:   Thu, 24 Aug 2023 22:31:29 +0100
Message-Id: <20230824213132.827338-7-vadim.fedorenko@linux.dev>
In-Reply-To: <20230824213132.827338-1-vadim.fedorenko@linux.dev>
References: <20230824213132.827338-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Add firmware admin command to access clock generation unit
configuration, it is required to enable Extended PTP and SyncE features
in the driver.
Add definitions of possible hardware variations of input and output pins
related to clock generation unit and functions to access the data.

Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v4->v5:
- fixes after net-next merge
v3->v4:
- rebase on top of net-next
v2->v3:
- rename NSEC_PER_PSEC to lowercase
- fix compilation on 32bit use div64_s64(..) for division
- fix typo refernce -> reference

v1->v2:
- fix kdoc warnings on dpll aq command functions
- remove convert_s48_to_s64(), use sign_extend64() instead
- move pins static definition to ice_ptp_hw.c, as only place where used
- remove unused struct definitions: ice_cgu_state, ice_cgu_state_desc
- fix flow in ice_get_cgu_state():
  - prevent possible NULL dereference
  - return 0 instead of status
- rename dpll mode FREERUN to DETACHED

 drivers/net/ethernet/intel/ice/ice.h          |   2 +
 .../net/ethernet/intel/ice/ice_adminq_cmd.h   | 246 +++++++-
 drivers/net/ethernet/intel/ice/ice_common.c   | 492 +++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_common.h   |  44 ++
 drivers/net/ethernet/intel/ice/ice_lib.c      |  17 +-
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c   | 530 ++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_ptp_hw.h   |  86 +++
 drivers/net/ethernet/intel/ice/ice_type.h     |   1 +
 8 files changed, 1385 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 5022b036ca4f..f89e0a83c29a 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -198,7 +198,9 @@
 enum ice_feature {
 	ICE_F_DSCP,
 	ICE_F_PTP_EXTTS,
+	ICE_F_PHY_RCLK,
 	ICE_F_SMA_CTRL,
+	ICE_F_CGU,
 	ICE_F_GNSS,
 	ICE_F_ROCE_LAG,
 	ICE_F_SRIOV_LAG,
diff --git a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
index 29f7a9852aec..b20241df4d3f 100644
--- a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
+++ b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
@@ -1351,6 +1351,30 @@ struct ice_aqc_set_mac_lb {
 	u8 reserved[15];
 };
 
+/* Set PHY recovered clock output (direct 0x0630) */
+struct ice_aqc_set_phy_rec_clk_out {
+	u8 phy_output;
+	u8 port_num;
+#define ICE_AQC_SET_PHY_REC_CLK_OUT_CURR_PORT	0xFF
+	u8 flags;
+#define ICE_AQC_SET_PHY_REC_CLK_OUT_OUT_EN	BIT(0)
+	u8 rsvd;
+	__le32 freq;
+	u8 rsvd2[6];
+	__le16 node_handle;
+};
+
+/* Get PHY recovered clock output (direct 0x0631) */
+struct ice_aqc_get_phy_rec_clk_out {
+	u8 phy_output;
+	u8 port_num;
+#define ICE_AQC_GET_PHY_REC_CLK_OUT_CURR_PORT	0xFF
+	u8 flags;
+#define ICE_AQC_GET_PHY_REC_CLK_OUT_OUT_EN	BIT(0)
+	u8 rsvd[11];
+	__le16 node_handle;
+};
+
 struct ice_aqc_link_topo_params {
 	u8 lport_num;
 	u8 lport_num_valid;
@@ -1367,6 +1391,8 @@ struct ice_aqc_link_topo_params {
 #define ICE_AQC_LINK_TOPO_NODE_TYPE_CAGE	6
 #define ICE_AQC_LINK_TOPO_NODE_TYPE_MEZZ	7
 #define ICE_AQC_LINK_TOPO_NODE_TYPE_ID_EEPROM	8
+#define ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_CTRL	9
+#define ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_MUX	10
 #define ICE_AQC_LINK_TOPO_NODE_CTX_S		4
 #define ICE_AQC_LINK_TOPO_NODE_CTX_M		\
 				(0xF << ICE_AQC_LINK_TOPO_NODE_CTX_S)
@@ -1403,8 +1429,12 @@ struct ice_aqc_link_topo_addr {
 struct ice_aqc_get_link_topo {
 	struct ice_aqc_link_topo_addr addr;
 	u8 node_part_num;
-#define ICE_AQC_GET_LINK_TOPO_NODE_NR_PCA9575	0x21
-#define ICE_AQC_GET_LINK_TOPO_NODE_NR_C827	0x31
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_PCA9575		0x21
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_ZL30632_80032	0x24
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_SI5383_5384	0x25
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_E822_PHY		0x30
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_C827		0x31
+#define ICE_AQC_GET_LINK_TOPO_NODE_NR_GEN_CLK_MUX	0x47
 	u8 rsvd[9];
 };
 
@@ -2125,6 +2155,193 @@ struct ice_aqc_get_pkg_info_resp {
 	struct ice_aqc_get_pkg_info pkg_info[];
 };
 
+/* Get CGU abilities command response data structure (indirect 0x0C61) */
+struct ice_aqc_get_cgu_abilities {
+	u8 num_inputs;
+	u8 num_outputs;
+	u8 pps_dpll_idx;
+	u8 eec_dpll_idx;
+	__le32 max_in_freq;
+	__le32 max_in_phase_adj;
+	__le32 max_out_freq;
+	__le32 max_out_phase_adj;
+	u8 cgu_part_num;
+	u8 rsvd[3];
+};
+
+/* Set CGU input config (direct 0x0C62) */
+struct ice_aqc_set_cgu_input_config {
+	u8 input_idx;
+	u8 flags1;
+#define ICE_AQC_SET_CGU_IN_CFG_FLG1_UPDATE_FREQ		BIT(6)
+#define ICE_AQC_SET_CGU_IN_CFG_FLG1_UPDATE_DELAY	BIT(7)
+	u8 flags2;
+#define ICE_AQC_SET_CGU_IN_CFG_FLG2_INPUT_EN		BIT(5)
+#define ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN		BIT(6)
+	u8 rsvd;
+	__le32 freq;
+	__le32 phase_delay;
+	u8 rsvd2[2];
+	__le16 node_handle;
+};
+
+/* Get CGU input config response descriptor structure (direct 0x0C63) */
+struct ice_aqc_get_cgu_input_config {
+	u8 input_idx;
+	u8 status;
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_LOS		BIT(0)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_SCM_FAIL		BIT(1)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_CFM_FAIL		BIT(2)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_GST_FAIL		BIT(3)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_PFM_FAIL		BIT(4)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_ESYNC_FAIL	BIT(6)
+#define ICE_AQC_GET_CGU_IN_CFG_STATUS_ESYNC_CAP		BIT(7)
+	u8 type;
+#define ICE_AQC_GET_CGU_IN_CFG_TYPE_READ_ONLY		BIT(0)
+#define ICE_AQC_GET_CGU_IN_CFG_TYPE_GPS			BIT(4)
+#define ICE_AQC_GET_CGU_IN_CFG_TYPE_EXTERNAL		BIT(5)
+#define ICE_AQC_GET_CGU_IN_CFG_TYPE_PHY			BIT(6)
+	u8 flags1;
+#define ICE_AQC_GET_CGU_IN_CFG_FLG1_PHASE_DELAY_SUPP	BIT(0)
+#define ICE_AQC_GET_CGU_IN_CFG_FLG1_1PPS_SUPP		BIT(2)
+#define ICE_AQC_GET_CGU_IN_CFG_FLG1_10MHZ_SUPP		BIT(3)
+#define ICE_AQC_GET_CGU_IN_CFG_FLG1_ANYFREQ		BIT(7)
+	__le32 freq;
+	__le32 phase_delay;
+	u8 flags2;
+#define ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN		BIT(5)
+#define ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN		BIT(6)
+	u8 rsvd[1];
+	__le16 node_handle;
+};
+
+/* Set CGU output config (direct 0x0C64) */
+struct ice_aqc_set_cgu_output_config {
+	u8 output_idx;
+	u8 flags;
+#define ICE_AQC_SET_CGU_OUT_CFG_OUT_EN		BIT(0)
+#define ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN	BIT(1)
+#define ICE_AQC_SET_CGU_OUT_CFG_UPDATE_FREQ     BIT(2)
+#define ICE_AQC_SET_CGU_OUT_CFG_UPDATE_PHASE    BIT(3)
+#define ICE_AQC_SET_CGU_OUT_CFG_UPDATE_SRC_SEL  BIT(4)
+	u8 src_sel;
+#define ICE_AQC_SET_CGU_OUT_CFG_DPLL_SRC_SEL    ICE_M(0x1F, 0)
+	u8 rsvd;
+	__le32 freq;
+	__le32 phase_delay;
+	u8 rsvd2[2];
+	__le16 node_handle;
+};
+
+/* Get CGU output config (direct 0x0C65) */
+struct ice_aqc_get_cgu_output_config {
+	u8 output_idx;
+	u8 flags;
+#define ICE_AQC_GET_CGU_OUT_CFG_OUT_EN		BIT(0)
+#define ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN	BIT(1)
+#define ICE_AQC_GET_CGU_OUT_CFG_ESYNC_ABILITY	BIT(2)
+	u8 src_sel;
+#define ICE_AQC_GET_CGU_OUT_CFG_DPLL_SRC_SEL_SHIFT	0
+#define ICE_AQC_GET_CGU_OUT_CFG_DPLL_SRC_SEL \
+	ICE_M(0x1F, ICE_AQC_GET_CGU_OUT_CFG_DPLL_SRC_SEL_SHIFT)
+#define ICE_AQC_GET_CGU_OUT_CFG_DPLL_MODE_SHIFT		5
+#define ICE_AQC_GET_CGU_OUT_CFG_DPLL_MODE \
+	ICE_M(0x7, ICE_AQC_GET_CGU_OUT_CFG_DPLL_MODE_SHIFT)
+	u8 rsvd;
+	__le32 freq;
+	__le32 src_freq;
+	u8 rsvd2[2];
+	__le16 node_handle;
+};
+
+/* Get CGU DPLL status (direct 0x0C66) */
+struct ice_aqc_get_cgu_dpll_status {
+	u8 dpll_num;
+	u8 ref_state;
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_LOS		BIT(0)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_SCM		BIT(1)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_CFM		BIT(2)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_GST		BIT(3)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_PFM		BIT(4)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_FAST_LOCK_EN	BIT(5)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_REF_SW_ESYNC	BIT(6)
+	u8 dpll_state;
+#define ICE_AQC_GET_CGU_DPLL_STATUS_STATE_LOCK		BIT(0)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_STATE_HO		BIT(1)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_STATE_HO_READY	BIT(2)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_STATE_FLHIT		BIT(5)
+#define ICE_AQC_GET_CGU_DPLL_STATUS_STATE_PSLHIT	BIT(7)
+	u8 config;
+#define ICE_AQC_GET_CGU_DPLL_CONFIG_CLK_REF_SEL		ICE_M(0x1F, 0)
+#define ICE_AQC_GET_CGU_DPLL_CONFIG_MODE_SHIFT		5
+#define ICE_AQC_GET_CGU_DPLL_CONFIG_MODE		\
+	ICE_M(0x7, ICE_AQC_GET_CGU_DPLL_CONFIG_MODE_SHIFT)
+#define ICE_AQC_GET_CGU_DPLL_CONFIG_MODE_FREERUN	0
+#define ICE_AQC_GET_CGU_DPLL_CONFIG_MODE_AUTOMATIC	\
+	ICE_M(0x3, ICE_AQC_GET_CGU_DPLL_CONFIG_MODE_SHIFT)
+	__le32 phase_offset_h;
+	__le32 phase_offset_l;
+	u8 eec_mode;
+#define ICE_AQC_GET_CGU_DPLL_STATUS_EEC_MODE_1		0xA
+#define ICE_AQC_GET_CGU_DPLL_STATUS_EEC_MODE_2		0xB
+#define ICE_AQC_GET_CGU_DPLL_STATUS_EEC_MODE_UNKNOWN	0xF
+	u8 rsvd[1];
+	__le16 node_handle;
+};
+
+/* Set CGU DPLL config (direct 0x0C67) */
+struct ice_aqc_set_cgu_dpll_config {
+	u8 dpll_num;
+	u8 ref_state;
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_LOS		BIT(0)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_SCM		BIT(1)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_CFM		BIT(2)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_GST		BIT(3)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_PFM		BIT(4)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_FLOCK_EN	BIT(5)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_REF_SW_ESYNC	BIT(6)
+	u8 rsvd;
+	u8 config;
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_CLK_REF_SEL		ICE_M(0x1F, 0)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_MODE_SHIFT		5
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_MODE		\
+	ICE_M(0x7, ICE_AQC_SET_CGU_DPLL_CONFIG_MODE_SHIFT)
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_MODE_FREERUN	0
+#define ICE_AQC_SET_CGU_DPLL_CONFIG_MODE_AUTOMATIC	\
+	ICE_M(0x3, ICE_AQC_SET_CGU_DPLL_CONFIG_MODE_SHIFT)
+	u8 rsvd2[8];
+	u8 eec_mode;
+	u8 rsvd3[1];
+	__le16 node_handle;
+};
+
+/* Set CGU reference priority (direct 0x0C68) */
+struct ice_aqc_set_cgu_ref_prio {
+	u8 dpll_num;
+	u8 ref_idx;
+	u8 ref_priority;
+	u8 rsvd[11];
+	__le16 node_handle;
+};
+
+/* Get CGU reference priority (direct 0x0C69) */
+struct ice_aqc_get_cgu_ref_prio {
+	u8 dpll_num;
+	u8 ref_idx;
+	u8 ref_priority; /* Valid only in response */
+	u8 rsvd[13];
+};
+
+/* Get CGU info (direct 0x0C6A) */
+struct ice_aqc_get_cgu_info {
+	__le32 cgu_id;
+	__le32 cgu_cfg_ver;
+	__le32 cgu_fw_ver;
+	u8 node_part_num;
+	u8 dev_rev;
+	__le16 node_handle;
+};
+
 /* Driver Shared Parameters (direct, 0x0C90) */
 struct ice_aqc_driver_shared_params {
 	u8 set_or_get_op;
@@ -2194,6 +2411,8 @@ struct ice_aq_desc {
 		struct ice_aqc_get_phy_caps get_phy;
 		struct ice_aqc_set_phy_cfg set_phy;
 		struct ice_aqc_restart_an restart_an;
+		struct ice_aqc_set_phy_rec_clk_out set_phy_rec_clk_out;
+		struct ice_aqc_get_phy_rec_clk_out get_phy_rec_clk_out;
 		struct ice_aqc_gpio read_write_gpio;
 		struct ice_aqc_sff_eeprom read_write_sff_param;
 		struct ice_aqc_set_port_id_led set_port_id_led;
@@ -2234,6 +2453,15 @@ struct ice_aq_desc {
 		struct ice_aqc_fw_logging fw_logging;
 		struct ice_aqc_get_clear_fw_log get_clear_fw_log;
 		struct ice_aqc_download_pkg download_pkg;
+		struct ice_aqc_set_cgu_input_config set_cgu_input_config;
+		struct ice_aqc_get_cgu_input_config get_cgu_input_config;
+		struct ice_aqc_set_cgu_output_config set_cgu_output_config;
+		struct ice_aqc_get_cgu_output_config get_cgu_output_config;
+		struct ice_aqc_get_cgu_dpll_status get_cgu_dpll_status;
+		struct ice_aqc_set_cgu_dpll_config set_cgu_dpll_config;
+		struct ice_aqc_set_cgu_ref_prio set_cgu_ref_prio;
+		struct ice_aqc_get_cgu_ref_prio get_cgu_ref_prio;
+		struct ice_aqc_get_cgu_info get_cgu_info;
 		struct ice_aqc_driver_shared_params drv_shared_params;
 		struct ice_aqc_set_mac_lb set_mac_lb;
 		struct ice_aqc_alloc_free_res_cmd sw_res_ctrl;
@@ -2358,6 +2586,8 @@ enum ice_adminq_opc {
 	ice_aqc_opc_get_link_status			= 0x0607,
 	ice_aqc_opc_set_event_mask			= 0x0613,
 	ice_aqc_opc_set_mac_lb				= 0x0620,
+	ice_aqc_opc_set_phy_rec_clk_out			= 0x0630,
+	ice_aqc_opc_get_phy_rec_clk_out			= 0x0631,
 	ice_aqc_opc_get_link_topo			= 0x06E0,
 	ice_aqc_opc_read_i2c				= 0x06E2,
 	ice_aqc_opc_write_i2c				= 0x06E3,
@@ -2413,6 +2643,18 @@ enum ice_adminq_opc {
 	ice_aqc_opc_update_pkg				= 0x0C42,
 	ice_aqc_opc_get_pkg_info_list			= 0x0C43,
 
+	/* 1588/SyncE commands/events */
+	ice_aqc_opc_get_cgu_abilities			= 0x0C61,
+	ice_aqc_opc_set_cgu_input_config		= 0x0C62,
+	ice_aqc_opc_get_cgu_input_config		= 0x0C63,
+	ice_aqc_opc_set_cgu_output_config		= 0x0C64,
+	ice_aqc_opc_get_cgu_output_config		= 0x0C65,
+	ice_aqc_opc_get_cgu_dpll_status			= 0x0C66,
+	ice_aqc_opc_set_cgu_dpll_config			= 0x0C67,
+	ice_aqc_opc_set_cgu_ref_prio			= 0x0C68,
+	ice_aqc_opc_get_cgu_ref_prio			= 0x0C69,
+	ice_aqc_opc_get_cgu_info			= 0x0C6A,
+
 	ice_aqc_opc_driver_shared_params		= 0x0C90,
 
 	/* Standalone Commands/Events */
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 80deca45ab59..089558b3b1ae 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -8,6 +8,7 @@
 #include "ice_ptp_hw.h"
 
 #define ICE_PF_RESET_WAIT_COUNT	300
+#define ICE_MAX_NETLIST_SIZE	10
 
 static const char * const ice_link_mode_str_low[] = {
 	[0] = "100BASE_TX",
@@ -435,6 +436,81 @@ ice_aq_get_link_topo_handle(struct ice_port_info *pi, u8 node_type,
 	return ice_aq_send_cmd(pi->hw, &desc, NULL, 0, cd);
 }
 
+/**
+ * ice_aq_get_netlist_node
+ * @hw: pointer to the hw struct
+ * @cmd: get_link_topo AQ structure
+ * @node_part_number: output node part number if node found
+ * @node_handle: output node handle parameter if node found
+ *
+ * Get netlist node handle.
+ */
+int
+ice_aq_get_netlist_node(struct ice_hw *hw, struct ice_aqc_get_link_topo *cmd,
+			u8 *node_part_number, u16 *node_handle)
+{
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_link_topo);
+	desc.params.get_link_topo = *cmd;
+
+	if (ice_aq_send_cmd(hw, &desc, NULL, 0, NULL))
+		return -EINTR;
+
+	if (node_handle)
+		*node_handle =
+			le16_to_cpu(desc.params.get_link_topo.addr.handle);
+	if (node_part_number)
+		*node_part_number = desc.params.get_link_topo.node_part_num;
+
+	return 0;
+}
+
+/**
+ * ice_find_netlist_node
+ * @hw: pointer to the hw struct
+ * @node_type_ctx: type of netlist node to look for
+ * @node_part_number: node part number to look for
+ * @node_handle: output parameter if node found - optional
+ *
+ * Find and return the node handle for a given node type and part number in the
+ * netlist. When found ICE_SUCCESS is returned, ICE_ERR_DOES_NOT_EXIST
+ * otherwise. If node_handle provided, it would be set to found node handle.
+ */
+int
+ice_find_netlist_node(struct ice_hw *hw, u8 node_type_ctx, u8 node_part_number,
+		      u16 *node_handle)
+{
+	struct ice_aqc_get_link_topo cmd;
+	u8 rec_node_part_number;
+	u16 rec_node_handle;
+	u8 idx;
+
+	for (idx = 0; idx < ICE_MAX_NETLIST_SIZE; idx++) {
+		int status;
+
+		memset(&cmd, 0, sizeof(cmd));
+
+		cmd.addr.topo_params.node_type_ctx =
+			(node_type_ctx << ICE_AQC_LINK_TOPO_NODE_TYPE_S);
+		cmd.addr.topo_params.index = idx;
+
+		status = ice_aq_get_netlist_node(hw, &cmd,
+						 &rec_node_part_number,
+						 &rec_node_handle);
+		if (status)
+			return status;
+
+		if (rec_node_part_number == node_part_number) {
+			if (node_handle)
+				*node_handle = rec_node_handle;
+			return 0;
+		}
+	}
+
+	return -ENOTBLK;
+}
+
 /**
  * ice_is_media_cage_present
  * @pi: port information structure
@@ -2654,33 +2730,6 @@ ice_parse_dev_caps(struct ice_hw *hw, struct ice_hw_dev_caps *dev_p,
 	ice_recalc_port_limited_caps(hw, &dev_p->common_cap);
 }
 
-/**
- * ice_aq_get_netlist_node
- * @hw: pointer to the hw struct
- * @cmd: get_link_topo AQ structure
- * @node_part_number: output node part number if node found
- * @node_handle: output node handle parameter if node found
- */
-static int
-ice_aq_get_netlist_node(struct ice_hw *hw, struct ice_aqc_get_link_topo *cmd,
-			u8 *node_part_number, u16 *node_handle)
-{
-	struct ice_aq_desc desc;
-
-	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_link_topo);
-	desc.params.get_link_topo = *cmd;
-
-	if (ice_aq_send_cmd(hw, &desc, NULL, 0, NULL))
-		return -EIO;
-
-	if (node_handle)
-		*node_handle = le16_to_cpu(desc.params.get_link_topo.addr.handle);
-	if (node_part_number)
-		*node_part_number = desc.params.get_link_topo.node_part_num;
-
-	return 0;
-}
-
 /**
  * ice_is_pf_c827 - check if pf contains c827 phy
  * @hw: pointer to the hw struct
@@ -4998,6 +5047,395 @@ ice_dis_vsi_rdma_qset(struct ice_port_info *pi, u16 count, u32 *qset_teid,
 	return status;
 }
 
+/**
+ * ice_aq_get_cgu_abilities - get cgu abilities
+ * @hw: pointer to the HW struct
+ * @abilities: CGU abilities
+ *
+ * Get CGU abilities (0x0C61)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_cgu_abilities(struct ice_hw *hw,
+			 struct ice_aqc_get_cgu_abilities *abilities)
+{
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_abilities);
+	return ice_aq_send_cmd(hw, &desc, abilities, sizeof(*abilities), NULL);
+}
+
+/**
+ * ice_aq_set_input_pin_cfg - set input pin config
+ * @hw: pointer to the HW struct
+ * @input_idx: Input index
+ * @flags1: Input flags
+ * @flags2: Input flags
+ * @freq: Frequency in Hz
+ * @phase_delay: Delay in ps
+ *
+ * Set CGU input config (0x0C62)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_set_input_pin_cfg(struct ice_hw *hw, u8 input_idx, u8 flags1, u8 flags2,
+			 u32 freq, s32 phase_delay)
+{
+	struct ice_aqc_set_cgu_input_config *cmd;
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_cgu_input_config);
+	cmd = &desc.params.set_cgu_input_config;
+	cmd->input_idx = input_idx;
+	cmd->flags1 = flags1;
+	cmd->flags2 = flags2;
+	cmd->freq = cpu_to_le32(freq);
+	cmd->phase_delay = cpu_to_le32(phase_delay);
+
+	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+}
+
+/**
+ * ice_aq_get_input_pin_cfg - get input pin config
+ * @hw: pointer to the HW struct
+ * @input_idx: Input index
+ * @status: Pin status
+ * @type: Pin type
+ * @flags1: Input flags
+ * @flags2: Input flags
+ * @freq: Frequency in Hz
+ * @phase_delay: Delay in ps
+ *
+ * Get CGU input config (0x0C63)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_input_pin_cfg(struct ice_hw *hw, u8 input_idx, u8 *status, u8 *type,
+			 u8 *flags1, u8 *flags2, u32 *freq, s32 *phase_delay)
+{
+	struct ice_aqc_get_cgu_input_config *cmd;
+	struct ice_aq_desc desc;
+	int ret;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_input_config);
+	cmd = &desc.params.get_cgu_input_config;
+	cmd->input_idx = input_idx;
+
+	ret = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!ret) {
+		if (status)
+			*status = cmd->status;
+		if (type)
+			*type = cmd->type;
+		if (flags1)
+			*flags1 = cmd->flags1;
+		if (flags2)
+			*flags2 = cmd->flags2;
+		if (freq)
+			*freq = le32_to_cpu(cmd->freq);
+		if (phase_delay)
+			*phase_delay = le32_to_cpu(cmd->phase_delay);
+	}
+
+	return ret;
+}
+
+/**
+ * ice_aq_set_output_pin_cfg - set output pin config
+ * @hw: pointer to the HW struct
+ * @output_idx: Output index
+ * @flags: Output flags
+ * @src_sel: Index of DPLL block
+ * @freq: Output frequency
+ * @phase_delay: Output phase compensation
+ *
+ * Set CGU output config (0x0C64)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_set_output_pin_cfg(struct ice_hw *hw, u8 output_idx, u8 flags,
+			  u8 src_sel, u32 freq, s32 phase_delay)
+{
+	struct ice_aqc_set_cgu_output_config *cmd;
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_cgu_output_config);
+	cmd = &desc.params.set_cgu_output_config;
+	cmd->output_idx = output_idx;
+	cmd->flags = flags;
+	cmd->src_sel = src_sel;
+	cmd->freq = cpu_to_le32(freq);
+	cmd->phase_delay = cpu_to_le32(phase_delay);
+
+	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+}
+
+/**
+ * ice_aq_get_output_pin_cfg - get output pin config
+ * @hw: pointer to the HW struct
+ * @output_idx: Output index
+ * @flags: Output flags
+ * @src_sel: Internal DPLL source
+ * @freq: Output frequency
+ * @src_freq: Source frequency
+ *
+ * Get CGU output config (0x0C65)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_output_pin_cfg(struct ice_hw *hw, u8 output_idx, u8 *flags,
+			  u8 *src_sel, u32 *freq, u32 *src_freq)
+{
+	struct ice_aqc_get_cgu_output_config *cmd;
+	struct ice_aq_desc desc;
+	int ret;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_output_config);
+	cmd = &desc.params.get_cgu_output_config;
+	cmd->output_idx = output_idx;
+
+	ret = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!ret) {
+		if (flags)
+			*flags = cmd->flags;
+		if (src_sel)
+			*src_sel = cmd->src_sel;
+		if (freq)
+			*freq = le32_to_cpu(cmd->freq);
+		if (src_freq)
+			*src_freq = le32_to_cpu(cmd->src_freq);
+	}
+
+	return ret;
+}
+
+/**
+ * ice_aq_get_cgu_dpll_status - get dpll status
+ * @hw: pointer to the HW struct
+ * @dpll_num: DPLL index
+ * @ref_state: Reference clock state
+ * @config: current DPLL config
+ * @dpll_state: current DPLL state
+ * @phase_offset: Phase offset in ns
+ * @eec_mode: EEC_mode
+ *
+ * Get CGU DPLL status (0x0C66)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_cgu_dpll_status(struct ice_hw *hw, u8 dpll_num, u8 *ref_state,
+			   u8 *dpll_state, u8 *config, s64 *phase_offset,
+			   u8 *eec_mode)
+{
+	struct ice_aqc_get_cgu_dpll_status *cmd;
+	const s64 nsec_per_psec = 1000LL;
+	struct ice_aq_desc desc;
+	int status;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_dpll_status);
+	cmd = &desc.params.get_cgu_dpll_status;
+	cmd->dpll_num = dpll_num;
+
+	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!status) {
+		*ref_state = cmd->ref_state;
+		*dpll_state = cmd->dpll_state;
+		*config = cmd->config;
+		*phase_offset = le32_to_cpu(cmd->phase_offset_h);
+		*phase_offset <<= 32;
+		*phase_offset += le32_to_cpu(cmd->phase_offset_l);
+		*phase_offset = div64_s64(sign_extend64(*phase_offset, 47),
+					  nsec_per_psec);
+		*eec_mode = cmd->eec_mode;
+	}
+
+	return status;
+}
+
+/**
+ * ice_aq_set_cgu_dpll_config - set dpll config
+ * @hw: pointer to the HW struct
+ * @dpll_num: DPLL index
+ * @ref_state: Reference clock state
+ * @config: DPLL config
+ * @eec_mode: EEC mode
+ *
+ * Set CGU DPLL config (0x0C67)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_set_cgu_dpll_config(struct ice_hw *hw, u8 dpll_num, u8 ref_state,
+			   u8 config, u8 eec_mode)
+{
+	struct ice_aqc_set_cgu_dpll_config *cmd;
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_cgu_dpll_config);
+	cmd = &desc.params.set_cgu_dpll_config;
+	cmd->dpll_num = dpll_num;
+	cmd->ref_state = ref_state;
+	cmd->config = config;
+	cmd->eec_mode = eec_mode;
+
+	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+}
+
+/**
+ * ice_aq_set_cgu_ref_prio - set input reference priority
+ * @hw: pointer to the HW struct
+ * @dpll_num: DPLL index
+ * @ref_idx: Reference pin index
+ * @ref_priority: Reference input priority
+ *
+ * Set CGU reference priority (0x0C68)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_set_cgu_ref_prio(struct ice_hw *hw, u8 dpll_num, u8 ref_idx,
+			u8 ref_priority)
+{
+	struct ice_aqc_set_cgu_ref_prio *cmd;
+	struct ice_aq_desc desc;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_cgu_ref_prio);
+	cmd = &desc.params.set_cgu_ref_prio;
+	cmd->dpll_num = dpll_num;
+	cmd->ref_idx = ref_idx;
+	cmd->ref_priority = ref_priority;
+
+	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+}
+
+/**
+ * ice_aq_get_cgu_ref_prio - get input reference priority
+ * @hw: pointer to the HW struct
+ * @dpll_num: DPLL index
+ * @ref_idx: Reference pin index
+ * @ref_prio: Reference input priority
+ *
+ * Get CGU reference priority (0x0C69)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_cgu_ref_prio(struct ice_hw *hw, u8 dpll_num, u8 ref_idx,
+			u8 *ref_prio)
+{
+	struct ice_aqc_get_cgu_ref_prio *cmd;
+	struct ice_aq_desc desc;
+	int status;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_ref_prio);
+	cmd = &desc.params.get_cgu_ref_prio;
+	cmd->dpll_num = dpll_num;
+	cmd->ref_idx = ref_idx;
+
+	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!status)
+		*ref_prio = cmd->ref_priority;
+
+	return status;
+}
+
+/**
+ * ice_aq_get_cgu_info - get cgu info
+ * @hw: pointer to the HW struct
+ * @cgu_id: CGU ID
+ * @cgu_cfg_ver: CGU config version
+ * @cgu_fw_ver: CGU firmware version
+ *
+ * Get CGU info (0x0C6A)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_cgu_info(struct ice_hw *hw, u32 *cgu_id, u32 *cgu_cfg_ver,
+		    u32 *cgu_fw_ver)
+{
+	struct ice_aqc_get_cgu_info *cmd;
+	struct ice_aq_desc desc;
+	int status;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_info);
+	cmd = &desc.params.get_cgu_info;
+
+	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!status) {
+		*cgu_id = le32_to_cpu(cmd->cgu_id);
+		*cgu_cfg_ver = le32_to_cpu(cmd->cgu_cfg_ver);
+		*cgu_fw_ver = le32_to_cpu(cmd->cgu_fw_ver);
+	}
+
+	return status;
+}
+
+/**
+ * ice_aq_set_phy_rec_clk_out - set RCLK phy out
+ * @hw: pointer to the HW struct
+ * @phy_output: PHY reference clock output pin
+ * @enable: GPIO state to be applied
+ * @freq: PHY output frequency
+ *
+ * Set phy recovered clock as reference (0x0630)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_set_phy_rec_clk_out(struct ice_hw *hw, u8 phy_output, bool enable,
+			   u32 *freq)
+{
+	struct ice_aqc_set_phy_rec_clk_out *cmd;
+	struct ice_aq_desc desc;
+	int status;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_phy_rec_clk_out);
+	cmd = &desc.params.set_phy_rec_clk_out;
+	cmd->phy_output = phy_output;
+	cmd->port_num = ICE_AQC_SET_PHY_REC_CLK_OUT_CURR_PORT;
+	cmd->flags = enable & ICE_AQC_SET_PHY_REC_CLK_OUT_OUT_EN;
+	cmd->freq = cpu_to_le32(*freq);
+
+	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!status)
+		*freq = le32_to_cpu(cmd->freq);
+
+	return status;
+}
+
+/**
+ * ice_aq_get_phy_rec_clk_out - get phy recovered signal info
+ * @hw: pointer to the HW struct
+ * @phy_output: PHY reference clock output pin
+ * @port_num: Port number
+ * @flags: PHY flags
+ * @node_handle: PHY output frequency
+ *
+ * Get PHY recovered clock output info (0x0631)
+ * Return: 0 on success or negative value on failure.
+ */
+int
+ice_aq_get_phy_rec_clk_out(struct ice_hw *hw, u8 *phy_output, u8 *port_num,
+			   u8 *flags, u16 *node_handle)
+{
+	struct ice_aqc_get_phy_rec_clk_out *cmd;
+	struct ice_aq_desc desc;
+	int status;
+
+	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_phy_rec_clk_out);
+	cmd = &desc.params.get_phy_rec_clk_out;
+	cmd->phy_output = *phy_output;
+
+	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
+	if (!status) {
+		*phy_output = cmd->phy_output;
+		if (port_num)
+			*port_num = cmd->port_num;
+		if (flags)
+			*flags = cmd->flags;
+		if (node_handle)
+			*node_handle = le16_to_cpu(cmd->node_handle);
+	}
+
+	return status;
+}
+
 /**
  * ice_replay_pre_init - replay pre initialization
  * @hw: pointer to the HW struct
diff --git a/drivers/net/ethernet/intel/ice/ice_common.h b/drivers/net/ethernet/intel/ice/ice_common.h
index 226b81f97a92..74e44b450de4 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.h
+++ b/drivers/net/ethernet/intel/ice/ice_common.h
@@ -94,6 +94,12 @@ ice_aq_get_phy_caps(struct ice_port_info *pi, bool qual_mods, u8 report_mode,
 		    struct ice_sq_cd *cd);
 bool ice_is_pf_c827(struct ice_hw *hw);
 int
+ice_find_netlist_node(struct ice_hw *hw, u8 node_type_ctx, u8 node_part_number,
+		      u16 *node_handle);
+int
+ice_aq_get_netlist_node(struct ice_hw *hw, struct ice_aqc_get_link_topo *cmd,
+			u8 *node_part_number, u16 *node_handle);
+int
 ice_aq_list_caps(struct ice_hw *hw, void *buf, u16 buf_size, u32 *cap_count,
 		 enum ice_adminq_opc opc, struct ice_sq_cd *cd);
 int
@@ -196,6 +202,44 @@ void ice_output_fw_log(struct ice_hw *hw, struct ice_aq_desc *desc, void *buf);
 struct ice_q_ctx *
 ice_get_lan_q_ctx(struct ice_hw *hw, u16 vsi_handle, u8 tc, u16 q_handle);
 int ice_sbq_rw_reg(struct ice_hw *hw, struct ice_sbq_msg_input *in);
+int
+ice_aq_get_cgu_abilities(struct ice_hw *hw,
+			 struct ice_aqc_get_cgu_abilities *abilities);
+int
+ice_aq_set_input_pin_cfg(struct ice_hw *hw, u8 input_idx, u8 flags1, u8 flags2,
+			 u32 freq, s32 phase_delay);
+int
+ice_aq_get_input_pin_cfg(struct ice_hw *hw, u8 input_idx, u8 *status, u8 *type,
+			 u8 *flags1, u8 *flags2, u32 *freq, s32 *phase_delay);
+int
+ice_aq_set_output_pin_cfg(struct ice_hw *hw, u8 output_idx, u8 flags,
+			  u8 src_sel, u32 freq, s32 phase_delay);
+int
+ice_aq_get_output_pin_cfg(struct ice_hw *hw, u8 output_idx, u8 *flags,
+			  u8 *src_sel, u32 *freq, u32 *src_freq);
+int
+ice_aq_get_cgu_dpll_status(struct ice_hw *hw, u8 dpll_num, u8 *ref_state,
+			   u8 *dpll_state, u8 *config, s64 *phase_offset,
+			   u8 *eec_mode);
+int
+ice_aq_set_cgu_dpll_config(struct ice_hw *hw, u8 dpll_num, u8 ref_state,
+			   u8 config, u8 eec_mode);
+int
+ice_aq_set_cgu_ref_prio(struct ice_hw *hw, u8 dpll_num, u8 ref_idx,
+			u8 ref_priority);
+int
+ice_aq_get_cgu_ref_prio(struct ice_hw *hw, u8 dpll_num, u8 ref_idx,
+			u8 *ref_prio);
+int
+ice_aq_get_cgu_info(struct ice_hw *hw, u32 *cgu_id, u32 *cgu_cfg_ver,
+		    u32 *cgu_fw_ver);
+
+int
+ice_aq_set_phy_rec_clk_out(struct ice_hw *hw, u8 phy_output, bool enable,
+			   u32 *freq);
+int
+ice_aq_get_phy_rec_clk_out(struct ice_hw *hw, u8 *phy_output, u8 *port_num,
+			   u8 *flags, u16 *node_handle);
 void
 ice_stat_update40(struct ice_hw *hw, u32 reg, bool prev_stat_loaded,
 		  u64 *prev_stat, u64 *cur_stat);
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 201570cd2e0b..01aa3d36b5a7 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -3985,13 +3985,22 @@ void ice_init_feature_support(struct ice_pf *pf)
 	case ICE_DEV_ID_E810C_BACKPLANE:
 	case ICE_DEV_ID_E810C_QSFP:
 	case ICE_DEV_ID_E810C_SFP:
+	case ICE_DEV_ID_E810_XXV_BACKPLANE:
+	case ICE_DEV_ID_E810_XXV_QSFP:
+	case ICE_DEV_ID_E810_XXV_SFP:
 		ice_set_feature_support(pf, ICE_F_DSCP);
 		ice_set_feature_support(pf, ICE_F_PTP_EXTTS);
-		if (ice_is_e810t(&pf->hw)) {
+		if (ice_is_phy_rclk_present(&pf->hw))
+			ice_set_feature_support(pf, ICE_F_PHY_RCLK);
+		/* If we don't own the timer - don't enable other caps */
+		if (!pf->hw.func_caps.ts_func_info.src_tmr_owned)
+			break;
+		if (ice_is_cgu_present(&pf->hw))
+			ice_set_feature_support(pf, ICE_F_CGU);
+		if (ice_is_clock_mux_present_e810t(&pf->hw))
 			ice_set_feature_support(pf, ICE_F_SMA_CTRL);
-			if (ice_gnss_is_gps_present(&pf->hw))
-				ice_set_feature_support(pf, ICE_F_GNSS);
-		}
+		if (ice_gnss_is_gps_present(&pf->hw))
+			ice_set_feature_support(pf, ICE_F_GNSS);
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
index 5a6ffa738396..223de0ed998b 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
@@ -7,6 +7,132 @@
 #include "ice_ptp_consts.h"
 #include "ice_cgu_regs.h"
 
+static struct dpll_pin_frequency ice_cgu_pin_freq_common[] = {
+	DPLL_PIN_FREQUENCY_1PPS,
+	DPLL_PIN_FREQUENCY_10MHZ,
+};
+
+static struct dpll_pin_frequency ice_cgu_pin_freq_1_hz[] = {
+	DPLL_PIN_FREQUENCY_1PPS,
+};
+
+static struct dpll_pin_frequency ice_cgu_pin_freq_10_mhz[] = {
+	DPLL_PIN_FREQUENCY_10MHZ,
+};
+
+static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
+	{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX, 0, },
+	{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX, 0, },
+	{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, 0, },
+};
+
+static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
+	{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX, },
+	{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX, },
+	{ "C827_1-RCLKA", ZL_REF2P, DPLL_PIN_TYPE_MUX, },
+	{ "C827_1-RCLKB", ZL_REF2N, DPLL_PIN_TYPE_MUX, },
+	{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, },
+};
+
+static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
+	{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, },
+	{ "MAC-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, },
+	{ "CVL-SDP21",	    ZL_OUT4, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "CVL-SDP23",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+};
+
+static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
+	{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "PHY2-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "MAC-CLK",	    ZL_OUT4, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "CVL-SDP21",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "CVL-SDP23",	    ZL_OUT6, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+};
+
+static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
+	{ "NONE",	  SI_REF0P, 0, 0 },
+	{ "NONE",	  SI_REF0N, 0, 0 },
+	{ "SYNCE0_DP",	  SI_REF1P, DPLL_PIN_TYPE_MUX, 0 },
+	{ "SYNCE0_DN",	  SI_REF1N, DPLL_PIN_TYPE_MUX, 0 },
+	{ "EXT_CLK_SYNC", SI_REF2P, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "NONE",	  SI_REF2N, 0, 0 },
+	{ "EXT_PPS_OUT",  SI_REF3,  DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "INT_PPS_OUT",  SI_REF4,  DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+};
+
+static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
+	{ "1588-TIME_SYNC", SI_OUT0, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "PHY-CLK",	    SI_OUT1, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "10MHZ-SMA2",	    SI_OUT2, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_10_mhz), ice_cgu_pin_freq_10_mhz },
+	{ "PPS-SMA1",	    SI_OUT3, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+};
+
+static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
+	{ "NONE",	  ZL_REF0P, 0, 0 },
+	{ "INT_PPS_OUT",  ZL_REF0N, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "SYNCE0_DP",	  ZL_REF1P, DPLL_PIN_TYPE_MUX, 0 },
+	{ "SYNCE0_DN",	  ZL_REF1N, DPLL_PIN_TYPE_MUX, 0 },
+	{ "NONE",	  ZL_REF2P, 0, 0 },
+	{ "NONE",	  ZL_REF2N, 0, 0 },
+	{ "EXT_CLK_SYNC", ZL_REF3P, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "NONE",	  ZL_REF3N, 0, 0 },
+	{ "EXT_PPS_OUT",  ZL_REF4P, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, 0 },
+};
+
+static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
+	{ "PPS-SMA1",	   ZL_OUT0, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
+	{ "10MHZ-SMA2",	   ZL_OUT1, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_10_mhz), ice_cgu_pin_freq_10_mhz },
+	{ "PHY-CLK",	   ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "1588-TIME_REF", ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
+	{ "CPK-TIME_SYNC", ZL_OUT4, DPLL_PIN_TYPE_EXT,
+		ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
+	{ "NONE",	   ZL_OUT5, 0, 0 },
+};
+
 /* Low level functions for interacting with and managing the device clock used
  * for the Precision Time Protocol.
  *
@@ -3308,6 +3434,90 @@ int ice_clear_phy_tstamp(struct ice_hw *hw, u8 block, u8 idx)
 		return ice_clear_phy_tstamp_e822(hw, block, idx);
 }
 
+/**
+ * ice_is_phy_rclk_present - check recovered clk presence
+ * @hw: pointer to the hw struct
+ *
+ * Check if the PHY Recovered Clock device is present in the netlist
+ * Return:
+ * * true - device found in netlist
+ * * false - device not found
+ */
+bool ice_is_phy_rclk_present(struct ice_hw *hw)
+{
+	if (ice_find_netlist_node(hw, ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_CTRL,
+				  ICE_AQC_GET_LINK_TOPO_NODE_NR_C827, NULL) &&
+	    ice_find_netlist_node(hw, ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_CTRL,
+				  ICE_AQC_GET_LINK_TOPO_NODE_NR_E822_PHY, NULL))
+		return false;
+
+	return true;
+}
+
+/**
+ * ice_is_clock_mux_present_e810t
+ * @hw: pointer to the hw struct
+ *
+ * Check if the Clock Multiplexer device is present in the netlist
+ * Return:
+ * * true - device found in netlist
+ * * false - device not found
+ */
+bool ice_is_clock_mux_present_e810t(struct ice_hw *hw)
+{
+	if (ice_find_netlist_node(hw, ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_MUX,
+				  ICE_AQC_GET_LINK_TOPO_NODE_NR_GEN_CLK_MUX,
+				  NULL))
+		return false;
+
+	return true;
+}
+
+/**
+ * ice_get_pf_c827_idx - find and return the C827 index for the current pf
+ * @hw: pointer to the hw struct
+ * @idx: index of the found C827 PHY
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+int ice_get_pf_c827_idx(struct ice_hw *hw, u8 *idx)
+{
+	struct ice_aqc_get_link_topo cmd;
+	u8 node_part_number;
+	u16 node_handle;
+	int status;
+	u8 ctx;
+
+	if (hw->mac_type != ICE_MAC_E810)
+		return -ENODEV;
+
+	if (hw->device_id != ICE_DEV_ID_E810C_QSFP) {
+		*idx = C827_0;
+		return 0;
+	}
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	ctx = ICE_AQC_LINK_TOPO_NODE_TYPE_PHY << ICE_AQC_LINK_TOPO_NODE_TYPE_S;
+	ctx |= ICE_AQC_LINK_TOPO_NODE_CTX_PORT << ICE_AQC_LINK_TOPO_NODE_CTX_S;
+	cmd.addr.topo_params.node_type_ctx = ctx;
+
+	status = ice_aq_get_netlist_node(hw, &cmd, &node_part_number,
+					 &node_handle);
+	if (status || node_part_number != ICE_AQC_GET_LINK_TOPO_NODE_NR_C827)
+		return -ENOENT;
+
+	if (node_handle == E810C_QSFP_C827_0_HANDLE)
+		*idx = C827_0;
+	else if (node_handle == E810C_QSFP_C827_1_HANDLE)
+		*idx = C827_1;
+	else
+		return -EIO;
+
+	return 0;
+}
+
 /**
  * ice_ptp_reset_ts_memory - Reset timestamp memory for all blocks
  * @hw: pointer to the HW struct
@@ -3362,3 +3572,323 @@ int ice_get_phy_tx_tstamp_ready(struct ice_hw *hw, u8 block, u64 *tstamp_ready)
 		return ice_get_phy_tx_tstamp_ready_e822(hw, block,
 							tstamp_ready);
 }
+
+/**
+ * ice_is_cgu_present - check for CGU presence
+ * @hw: pointer to the hw struct
+ *
+ * Check if the Clock Generation Unit (CGU) device is present in the netlist
+ * Return:
+ * * true - cgu is present
+ * * false - cgu is not present
+ */
+bool ice_is_cgu_present(struct ice_hw *hw)
+{
+	if (!ice_find_netlist_node(hw, ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_CTRL,
+				   ICE_AQC_GET_LINK_TOPO_NODE_NR_ZL30632_80032,
+				   NULL)) {
+		hw->cgu_part_number = ICE_AQC_GET_LINK_TOPO_NODE_NR_ZL30632_80032;
+		return true;
+	} else if (!ice_find_netlist_node(hw,
+					  ICE_AQC_LINK_TOPO_NODE_TYPE_CLK_CTRL,
+					  ICE_AQC_GET_LINK_TOPO_NODE_NR_SI5383_5384,
+					  NULL)) {
+		hw->cgu_part_number = ICE_AQC_GET_LINK_TOPO_NODE_NR_SI5383_5384;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * ice_cgu_get_pin_desc_e823 - get pin description array
+ * @hw: pointer to the hw struct
+ * @input: if request is done against input or output pin
+ * @size: number of inputs/outputs
+ *
+ * Return: pointer to pin description array associated to given hw.
+ */
+static const struct ice_cgu_pin_desc *
+ice_cgu_get_pin_desc_e823(struct ice_hw *hw, bool input, int *size)
+{
+	static const struct ice_cgu_pin_desc *t;
+
+	if (hw->cgu_part_number ==
+	    ICE_AQC_GET_LINK_TOPO_NODE_NR_ZL30632_80032) {
+		if (input) {
+			t = ice_e823_zl_cgu_inputs;
+			*size = ARRAY_SIZE(ice_e823_zl_cgu_inputs);
+		} else {
+			t = ice_e823_zl_cgu_outputs;
+			*size = ARRAY_SIZE(ice_e823_zl_cgu_outputs);
+		}
+	} else if (hw->cgu_part_number ==
+		   ICE_AQC_GET_LINK_TOPO_NODE_NR_SI5383_5384) {
+		if (input) {
+			t = ice_e823_si_cgu_inputs;
+			*size = ARRAY_SIZE(ice_e823_si_cgu_inputs);
+		} else {
+			t = ice_e823_si_cgu_outputs;
+			*size = ARRAY_SIZE(ice_e823_si_cgu_outputs);
+		}
+	} else {
+		t = NULL;
+		*size = 0;
+	}
+
+	return t;
+}
+
+/**
+ * ice_cgu_get_pin_desc - get pin description array
+ * @hw: pointer to the hw struct
+ * @input: if request is done against input or output pins
+ * @size: size of array returned by function
+ *
+ * Return: pointer to pin description array associated to given hw.
+ */
+static const struct ice_cgu_pin_desc *
+ice_cgu_get_pin_desc(struct ice_hw *hw, bool input, int *size)
+{
+	const struct ice_cgu_pin_desc *t = NULL;
+
+	switch (hw->device_id) {
+	case ICE_DEV_ID_E810C_SFP:
+		if (input) {
+			t = ice_e810t_sfp_cgu_inputs;
+			*size = ARRAY_SIZE(ice_e810t_sfp_cgu_inputs);
+		} else {
+			t = ice_e810t_sfp_cgu_outputs;
+			*size = ARRAY_SIZE(ice_e810t_sfp_cgu_outputs);
+		}
+		break;
+	case ICE_DEV_ID_E810C_QSFP:
+		if (input) {
+			t = ice_e810t_qsfp_cgu_inputs;
+			*size = ARRAY_SIZE(ice_e810t_qsfp_cgu_inputs);
+		} else {
+			t = ice_e810t_qsfp_cgu_outputs;
+			*size = ARRAY_SIZE(ice_e810t_qsfp_cgu_outputs);
+		}
+		break;
+	case ICE_DEV_ID_E823L_10G_BASE_T:
+	case ICE_DEV_ID_E823L_1GBE:
+	case ICE_DEV_ID_E823L_BACKPLANE:
+	case ICE_DEV_ID_E823L_QSFP:
+	case ICE_DEV_ID_E823L_SFP:
+	case ICE_DEV_ID_E823C_10G_BASE_T:
+	case ICE_DEV_ID_E823C_BACKPLANE:
+	case ICE_DEV_ID_E823C_QSFP:
+	case ICE_DEV_ID_E823C_SFP:
+	case ICE_DEV_ID_E823C_SGMII:
+		t = ice_cgu_get_pin_desc_e823(hw, input, size);
+		break;
+	default:
+		break;
+	}
+
+	return t;
+}
+
+/**
+ * ice_cgu_get_pin_type - get pin's type
+ * @hw: pointer to the hw struct
+ * @pin: pin index
+ * @input: if request is done against input or output pin
+ *
+ * Return: type of a pin.
+ */
+enum dpll_pin_type ice_cgu_get_pin_type(struct ice_hw *hw, u8 pin, bool input)
+{
+	const struct ice_cgu_pin_desc *t;
+	int t_size;
+
+	t = ice_cgu_get_pin_desc(hw, input, &t_size);
+
+	if (!t)
+		return 0;
+
+	if (pin >= t_size)
+		return 0;
+
+	return t[pin].type;
+}
+
+/**
+ * ice_cgu_get_pin_freq_supp - get pin's supported frequency
+ * @hw: pointer to the hw struct
+ * @pin: pin index
+ * @input: if request is done against input or output pin
+ * @num: output number of supported frequencies
+ *
+ * Get frequency supported number and array of supported frequencies.
+ *
+ * Return: array of supported frequencies for given pin.
+ */
+struct dpll_pin_frequency *
+ice_cgu_get_pin_freq_supp(struct ice_hw *hw, u8 pin, bool input, u8 *num)
+{
+	const struct ice_cgu_pin_desc *t;
+	int t_size;
+
+	*num = 0;
+	t = ice_cgu_get_pin_desc(hw, input, &t_size);
+	if (!t)
+		return NULL;
+	if (pin >= t_size)
+		return NULL;
+	*num = t[pin].freq_supp_num;
+
+	return t[pin].freq_supp;
+}
+
+/**
+ * ice_cgu_get_pin_name - get pin's name
+ * @hw: pointer to the hw struct
+ * @pin: pin index
+ * @input: if request is done against input or output pin
+ *
+ * Return:
+ * * null terminated char array with name
+ * * NULL in case of failure
+ */
+const char *ice_cgu_get_pin_name(struct ice_hw *hw, u8 pin, bool input)
+{
+	const struct ice_cgu_pin_desc *t;
+	int t_size;
+
+	t = ice_cgu_get_pin_desc(hw, input, &t_size);
+
+	if (!t)
+		return NULL;
+
+	if (pin >= t_size)
+		return NULL;
+
+	return t[pin].name;
+}
+
+/**
+ * ice_get_cgu_state - get the state of the DPLL
+ * @hw: pointer to the hw struct
+ * @dpll_idx: Index of internal DPLL unit
+ * @last_dpll_state: last known state of DPLL
+ * @pin: pointer to a buffer for returning currently active pin
+ * @ref_state: reference clock state
+ * @eec_mode: eec mode of the DPLL
+ * @phase_offset: pointer to a buffer for returning phase offset
+ * @dpll_state: state of the DPLL (output)
+ *
+ * This function will read the state of the DPLL(dpll_idx). Non-null
+ * 'pin', 'ref_state', 'eec_mode' and 'phase_offset' parameters are used to
+ * retrieve currently active pin, state, mode and phase_offset respectively.
+ *
+ * Return: state of the DPLL
+ */
+int ice_get_cgu_state(struct ice_hw *hw, u8 dpll_idx,
+		      enum dpll_lock_status last_dpll_state, u8 *pin,
+		      u8 *ref_state, u8 *eec_mode, s64 *phase_offset,
+		      enum dpll_lock_status *dpll_state)
+{
+	u8 hw_ref_state, hw_dpll_state, hw_eec_mode, hw_config;
+	s64 hw_phase_offset;
+	int status;
+
+	status = ice_aq_get_cgu_dpll_status(hw, dpll_idx, &hw_ref_state,
+					    &hw_dpll_state, &hw_config,
+					    &hw_phase_offset, &hw_eec_mode);
+	if (status)
+		return status;
+
+	if (pin)
+		/* current ref pin in dpll_state_refsel_status_X register */
+		*pin = hw_config & ICE_AQC_GET_CGU_DPLL_CONFIG_CLK_REF_SEL;
+	if (phase_offset)
+		*phase_offset = hw_phase_offset;
+	if (ref_state)
+		*ref_state = hw_ref_state;
+	if (eec_mode)
+		*eec_mode = hw_eec_mode;
+	if (!dpll_state)
+		return 0;
+
+	/* According to ZL DPLL documentation, once state reach LOCKED_HO_ACQ
+	 * it would never return to FREERUN. This aligns to ITU-T G.781
+	 * Recommendation. We cannot report HOLDOVER as HO memory is cleared
+	 * while switching to another reference.
+	 * Only for situations where previous state was either: "LOCKED without
+	 * HO_ACQ" or "HOLDOVER" we actually back to FREERUN.
+	 */
+	if (hw_dpll_state & ICE_AQC_GET_CGU_DPLL_STATUS_STATE_LOCK) {
+		if (hw_dpll_state & ICE_AQC_GET_CGU_DPLL_STATUS_STATE_HO_READY)
+			*dpll_state = DPLL_LOCK_STATUS_LOCKED_HO_ACQ;
+		else
+			*dpll_state = DPLL_LOCK_STATUS_LOCKED;
+	} else if (last_dpll_state == DPLL_LOCK_STATUS_LOCKED_HO_ACQ ||
+		   last_dpll_state == DPLL_LOCK_STATUS_HOLDOVER) {
+		*dpll_state = DPLL_LOCK_STATUS_HOLDOVER;
+	} else {
+		*dpll_state = DPLL_LOCK_STATUS_UNLOCKED;
+	}
+
+	return 0;
+}
+
+/**
+ * ice_get_cgu_rclk_pin_info - get info on available recovered clock pins
+ * @hw: pointer to the hw struct
+ * @base_idx: returns index of first recovered clock pin on device
+ * @pin_num: returns number of recovered clock pins available on device
+ *
+ * Based on hw provide caller info about recovery clock pins available on the
+ * board.
+ *
+ * Return:
+ * * 0 - success, information is valid
+ * * negative - failure, information is not valid
+ */
+int ice_get_cgu_rclk_pin_info(struct ice_hw *hw, u8 *base_idx, u8 *pin_num)
+{
+	u8 phy_idx;
+	int ret;
+
+	switch (hw->device_id) {
+	case ICE_DEV_ID_E810C_SFP:
+	case ICE_DEV_ID_E810C_QSFP:
+
+		ret = ice_get_pf_c827_idx(hw, &phy_idx);
+		if (ret)
+			return ret;
+		*base_idx = E810T_CGU_INPUT_C827(phy_idx, ICE_RCLKA_PIN);
+		*pin_num = ICE_E810_RCLK_PINS_NUM;
+		ret = 0;
+		break;
+	case ICE_DEV_ID_E823L_10G_BASE_T:
+	case ICE_DEV_ID_E823L_1GBE:
+	case ICE_DEV_ID_E823L_BACKPLANE:
+	case ICE_DEV_ID_E823L_QSFP:
+	case ICE_DEV_ID_E823L_SFP:
+	case ICE_DEV_ID_E823C_10G_BASE_T:
+	case ICE_DEV_ID_E823C_BACKPLANE:
+	case ICE_DEV_ID_E823C_QSFP:
+	case ICE_DEV_ID_E823C_SFP:
+	case ICE_DEV_ID_E823C_SGMII:
+		*pin_num = ICE_E822_RCLK_PINS_NUM;
+		ret = 0;
+		if (hw->cgu_part_number ==
+		    ICE_AQC_GET_LINK_TOPO_NODE_NR_ZL30632_80032)
+			*base_idx = ZL_REF1P;
+		else if (hw->cgu_part_number ==
+			 ICE_AQC_GET_LINK_TOPO_NODE_NR_SI5383_5384)
+			*base_idx = SI_REF1P;
+		else
+			ret = -ENODEV;
+
+		break;
+	default:
+		ret = -ENODEV;
+		break;
+	}
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.h b/drivers/net/ethernet/intel/ice/ice_ptp_hw.h
index 13547707b8e3..fe17a1b09646 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.h
+++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.h
@@ -3,6 +3,7 @@
 
 #ifndef _ICE_PTP_HW_H_
 #define _ICE_PTP_HW_H_
+#include <linux/dpll.h>
 
 enum ice_ptp_tmr_cmd {
 	INIT_TIME,
@@ -109,6 +110,77 @@ struct ice_cgu_pll_params_e822 {
 	u32 post_pll_div;
 };
 
+#define E810C_QSFP_C827_0_HANDLE	2
+#define E810C_QSFP_C827_1_HANDLE	3
+enum ice_e810_c827_idx {
+	C827_0,
+	C827_1
+};
+
+enum ice_phy_rclk_pins {
+	ICE_RCLKA_PIN = 0,		/* SCL pin */
+	ICE_RCLKB_PIN,			/* SDA pin */
+};
+
+#define ICE_E810_RCLK_PINS_NUM		(ICE_RCLKB_PIN + 1)
+#define ICE_E822_RCLK_PINS_NUM		(ICE_RCLKA_PIN + 1)
+#define E810T_CGU_INPUT_C827(_phy, _pin) ((_phy) * ICE_E810_RCLK_PINS_NUM + \
+					  (_pin) + ZL_REF1P)
+
+enum ice_zl_cgu_in_pins {
+	ZL_REF0P = 0,
+	ZL_REF0N,
+	ZL_REF1P,
+	ZL_REF1N,
+	ZL_REF2P,
+	ZL_REF2N,
+	ZL_REF3P,
+	ZL_REF3N,
+	ZL_REF4P,
+	ZL_REF4N,
+	NUM_ZL_CGU_INPUT_PINS
+};
+
+enum ice_zl_cgu_out_pins {
+	ZL_OUT0 = 0,
+	ZL_OUT1,
+	ZL_OUT2,
+	ZL_OUT3,
+	ZL_OUT4,
+	ZL_OUT5,
+	ZL_OUT6,
+	NUM_ZL_CGU_OUTPUT_PINS
+};
+
+enum ice_si_cgu_in_pins {
+	SI_REF0P = 0,
+	SI_REF0N,
+	SI_REF1P,
+	SI_REF1N,
+	SI_REF2P,
+	SI_REF2N,
+	SI_REF3,
+	SI_REF4,
+	NUM_SI_CGU_INPUT_PINS
+};
+
+enum ice_si_cgu_out_pins {
+	SI_OUT0 = 0,
+	SI_OUT1,
+	SI_OUT2,
+	SI_OUT3,
+	SI_OUT4,
+	NUM_SI_CGU_OUTPUT_PINS
+};
+
+struct ice_cgu_pin_desc {
+	char *name;
+	u8 index;
+	enum dpll_pin_type type;
+	u32 freq_supp_num;
+	struct dpll_pin_frequency *freq_supp;
+};
+
 extern const struct
 ice_cgu_pll_params_e822 e822_cgu_params[NUM_ICE_TIME_REF_FREQ];
 
@@ -196,6 +268,20 @@ int ice_ptp_init_phy_e810(struct ice_hw *hw);
 int ice_read_sma_ctrl_e810t(struct ice_hw *hw, u8 *data);
 int ice_write_sma_ctrl_e810t(struct ice_hw *hw, u8 data);
 int ice_read_pca9575_reg_e810t(struct ice_hw *hw, u8 offset, u8 *data);
+bool ice_is_pca9575_present(struct ice_hw *hw);
+bool ice_is_phy_rclk_present(struct ice_hw *hw);
+bool ice_is_clock_mux_present_e810t(struct ice_hw *hw);
+int ice_get_pf_c827_idx(struct ice_hw *hw, u8 *idx);
+bool ice_is_cgu_present(struct ice_hw *hw);
+enum dpll_pin_type ice_cgu_get_pin_type(struct ice_hw *hw, u8 pin, bool input);
+struct dpll_pin_frequency *
+ice_cgu_get_pin_freq_supp(struct ice_hw *hw, u8 pin, bool input, u8 *num);
+const char *ice_cgu_get_pin_name(struct ice_hw *hw, u8 pin, bool input);
+int ice_get_cgu_state(struct ice_hw *hw, u8 dpll_idx,
+		      enum dpll_lock_status last_dpll_state, u8 *pin,
+		      u8 *ref_state, u8 *eec_mode, s64 *phase_offset,
+		      enum dpll_lock_status *dpll_state);
+int ice_get_cgu_rclk_pin_info(struct ice_hw *hw, u8 *base_idx, u8 *pin_num);
 
 #define PFTSYN_SEM_BYTES	4
 
diff --git a/drivers/net/ethernet/intel/ice/ice_type.h b/drivers/net/ethernet/intel/ice/ice_type.h
index 5e353b0cbe6f..5eb778d9ae64 100644
--- a/drivers/net/ethernet/intel/ice/ice_type.h
+++ b/drivers/net/ethernet/intel/ice/ice_type.h
@@ -965,6 +965,7 @@ struct ice_hw {
 	DECLARE_BITMAP(hw_ptype, ICE_FLOW_PTYPE_MAX);
 	u8 dvm_ena;
 	u16 io_expander_handle;
+	u8 cgu_part_number;
 };
 
 /* Statistics collected by each port, VSI, VEB, and S-channel */
-- 
2.27.0


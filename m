Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E907863B4
	for <lists+linux-clk@lfdr.de>; Thu, 24 Aug 2023 00:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbjHWWx5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Aug 2023 18:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238800AbjHWWxa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 18:53:30 -0400
Received: from out-56.mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A72AE7D
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 15:53:23 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692831200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0IXCJV7LcPCqPo+gD7uS8fnt4sQRJvwjJNAqnWEUF7Q=;
        b=h3kCSOqnGfZ97AMYGvw0CVXg0h/fdjCrtm1v057GLYpy4oEwh/6AyD7cdzBnnnbLFTjx6J
        j6S38yeIep0tcNO9YpaeusGztRjENj5MwxeyRyiWCFMJ3rGpVpecPjeWAQRGAfhzBp/vMe
        oqwPSOsw4j2jyd6Wn+3NXwvg5DDTwDU=
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
Subject: [PATCH net-next v6 7/9] ice: implement dpll interface to control cgu
Date:   Wed, 23 Aug 2023 23:52:40 +0100
Message-Id: <20230823225242.817957-8-vadim.fedorenko@linux.dev>
In-Reply-To: <20230823225242.817957-1-vadim.fedorenko@linux.dev>
References: <20230823225242.817957-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Control over clock generation unit is required for further development
of Synchronous Ethernet feature. Interface provides ability to obtain
current state of a dpll, its sources and outputs which are pins, and
allows their configuration.

Co-developed-by: Milena Olech <milena.olech@intel.com>
Signed-off-by: Milena Olech <milena.olech@intel.com>
Co-developed-by: Michal Michalik <michal.michalik@intel.com>
Signed-off-by: Michal Michalik <michal.michalik@intel.com>
Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v5->v6:
- rename DPLL_PIN_CAPS_* -> DPLL_PIN_CAPABILITIES_*

v4->v5:
- clear_bit() only as test was done prior to call ice_dpll_deinit()

v3->v4:
- rebase on top of net-next
- improve flag usage

v2->v3:
- use ICE_FLAG_DPLL only for deinit in ice_main.c
- remove ice_dpll_cb_lock(..)

v1->v2:
- fix init mutex
- use mutex_lock instead of trylock
- fix ice_dpll_cb_lock docs
- remove leftover mutex_unlock() on dpll init
- fix ice_dpll_cb_lock docs
- fix 'Context:' description of functions
- fix typo properities->properties
- fix RCT variable order in ice_dpll_pin_freq_set()
- fix ice_dpll_pin_state_update(), make function static, declare variables
  outside of switch case
- fix check if dpll_state was LOCKED OR LOCKED_HO_ACQ for init dpll
  state update
- fix unlock mutex on error in kworker
- fix init ret variable
- fix init ret variable on error in ice_dpll_init_info()
- fix typo userpsace->userspace
- rename dpll mode FREERUN to DETACHED

 drivers/net/ethernet/intel/Kconfig        |    1 +
 drivers/net/ethernet/intel/ice/Makefile   |    3 +-
 drivers/net/ethernet/intel/ice/ice.h      |    3 +
 drivers/net/ethernet/intel/ice/ice_dpll.c | 1904 +++++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_dpll.h |  104 ++
 drivers/net/ethernet/intel/ice/ice_main.c |    6 +
 6 files changed, 2020 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
 create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h

diff --git a/drivers/net/ethernet/intel/Kconfig b/drivers/net/ethernet/intel/Kconfig
index 9bc0a9519899..913dcf928d15 100644
--- a/drivers/net/ethernet/intel/Kconfig
+++ b/drivers/net/ethernet/intel/Kconfig
@@ -284,6 +284,7 @@ config ICE
 	select DIMLIB
 	select NET_DEVLINK
 	select PLDMFW
+	select DPLL
 	help
 	  This driver supports Intel(R) Ethernet Connection E800 Series of
 	  devices.  For more information on how to identify your adapter, go
diff --git a/drivers/net/ethernet/intel/ice/Makefile b/drivers/net/ethernet/intel/ice/Makefile
index 960277d78e09..00806ddf5bf0 100644
--- a/drivers/net/ethernet/intel/ice/Makefile
+++ b/drivers/net/ethernet/intel/ice/Makefile
@@ -34,7 +34,8 @@ ice-y := ice_main.o	\
 	 ice_lag.o	\
 	 ice_ethtool.o  \
 	 ice_repr.o	\
-	 ice_tc_lib.o
+	 ice_tc_lib.o	\
+	 ice_dpll.o
 ice-$(CONFIG_PCI_IOV) +=	\
 	ice_sriov.o		\
 	ice_virtchnl.o		\
diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index f89e0a83c29a..fdcfe2e3aabd 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -76,6 +76,7 @@
 #include "ice_vsi_vlan_ops.h"
 #include "ice_gnss.h"
 #include "ice_irq.h"
+#include "ice_dpll.h"
 
 #define ICE_BAR0		0
 #define ICE_REQ_DESC_MULTIPLE	32
@@ -510,6 +511,7 @@ enum ice_pf_flags {
 	ICE_FLAG_UNPLUG_AUX_DEV,
 	ICE_FLAG_MTU_CHANGED,
 	ICE_FLAG_GNSS,			/* GNSS successfully initialized */
+	ICE_FLAG_DPLL,			/* SyncE/PTP dplls initialized */
 	ICE_PF_FLAGS_NBITS		/* must be last */
 };
 
@@ -642,6 +644,7 @@ struct ice_pf {
 #define ICE_VF_AGG_NODE_ID_START	65
 #define ICE_MAX_VF_AGG_NODES		32
 	struct ice_agg_node vf_agg_node[ICE_MAX_VF_AGG_NODES];
+	struct ice_dplls dplls;
 };
 
 extern struct workqueue_struct *ice_lag_wq;
diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
new file mode 100644
index 000000000000..1faee9cb944d
--- /dev/null
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -0,0 +1,1904 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2022, Intel Corporation. */
+
+#include "ice.h"
+#include "ice_lib.h"
+#include "ice_trace.h"
+#include <linux/dpll.h>
+
+#define ICE_CGU_STATE_ACQ_ERR_THRESHOLD		50
+#define ICE_DPLL_PIN_IDX_INVALID		0xff
+#define ICE_DPLL_RCLK_NUM_PER_PF		1
+
+/**
+ * enum ice_dpll_pin_type - enumerate ice pin types:
+ * @ICE_DPLL_PIN_INVALID: invalid pin type
+ * @ICE_DPLL_PIN_TYPE_INPUT: input pin
+ * @ICE_DPLL_PIN_TYPE_OUTPUT: output pin
+ * @ICE_DPLL_PIN_TYPE_RCLK_INPUT: recovery clock input pin
+ */
+enum ice_dpll_pin_type {
+	ICE_DPLL_PIN_INVALID,
+	ICE_DPLL_PIN_TYPE_INPUT,
+	ICE_DPLL_PIN_TYPE_OUTPUT,
+	ICE_DPLL_PIN_TYPE_RCLK_INPUT,
+};
+
+static const char * const pin_type_name[] = {
+	[ICE_DPLL_PIN_TYPE_INPUT] = "input",
+	[ICE_DPLL_PIN_TYPE_OUTPUT] = "output",
+	[ICE_DPLL_PIN_TYPE_RCLK_INPUT] = "rclk-input",
+};
+
+/**
+ * ice_dpll_pin_freq_set - set pin's frequency
+ * @pf: private board structure
+ * @pin: pointer to a pin
+ * @pin_type: type of pin being configured
+ * @freq: frequency to be set
+ * @extack: error reporting
+ *
+ * Set requested frequency on a pin.
+ *
+ * Context: Called under pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error on AQ or wrong pin type given
+ */
+static int
+ice_dpll_pin_freq_set(struct ice_pf *pf, struct ice_dpll_pin *pin,
+		      enum ice_dpll_pin_type pin_type, const u32 freq,
+		      struct netlink_ext_ack *extack)
+{
+	u8 flags;
+	int ret;
+
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		flags = ICE_AQC_SET_CGU_IN_CFG_FLG1_UPDATE_FREQ;
+		ret = ice_aq_set_input_pin_cfg(&pf->hw, pin->idx, flags,
+					       pin->flags[0], freq, 0);
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		flags = ICE_AQC_SET_CGU_OUT_CFG_UPDATE_FREQ;
+		ret = ice_aq_set_output_pin_cfg(&pf->hw, pin->idx, flags,
+						0, freq, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to set pin freq:%u on pin:%u\n",
+				   ret,
+				   ice_aq_str(pf->hw.adminq.sq_last_status),
+				   freq, pin->idx);
+		return ret;
+	}
+	pin->freq = freq;
+
+	return 0;
+}
+
+/**
+ * ice_dpll_frequency_set - wrapper for pin callback for set frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: frequency to be set
+ * @extack: error reporting
+ * @pin_type: type of pin being configured
+ *
+ * Wraps internal set frequency command on a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't set in hw
+ */
+static int
+ice_dpll_frequency_set(const struct dpll_pin *pin, void *pin_priv,
+		       const struct dpll_device *dpll, void *dpll_priv,
+		       const u32 frequency,
+		       struct netlink_ext_ack *extack,
+		       enum ice_dpll_pin_type pin_type)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+	int ret;
+
+	mutex_lock(&pf->dplls.lock);
+	ret = ice_dpll_pin_freq_set(pf, p, pin_type, frequency, extack);
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_input_frequency_set - input pin callback for set frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: frequency to be set
+ * @extack: error reporting
+ *
+ * Wraps internal set frequency command on a pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't set in hw
+ */
+static int
+ice_dpll_input_frequency_set(const struct dpll_pin *pin, void *pin_priv,
+			     const struct dpll_device *dpll, void *dpll_priv,
+			     u64 frequency, struct netlink_ext_ack *extack)
+{
+	return ice_dpll_frequency_set(pin, pin_priv, dpll, dpll_priv, frequency,
+				      extack, ICE_DPLL_PIN_TYPE_INPUT);
+}
+
+/**
+ * ice_dpll_output_frequency_set - output pin callback for set frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: frequency to be set
+ * @extack: error reporting
+ *
+ * Wraps internal set frequency command on a pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't set in hw
+ */
+static int
+ice_dpll_output_frequency_set(const struct dpll_pin *pin, void *pin_priv,
+			      const struct dpll_device *dpll, void *dpll_priv,
+			      u64 frequency, struct netlink_ext_ack *extack)
+{
+	return ice_dpll_frequency_set(pin, pin_priv, dpll, dpll_priv, frequency,
+				      extack, ICE_DPLL_PIN_TYPE_OUTPUT);
+}
+
+/**
+ * ice_dpll_frequency_get - wrapper for pin callback for get frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: on success holds pin's frequency
+ * @extack: error reporting
+ * @pin_type: type of pin being configured
+ *
+ * Wraps internal get frequency command of a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't get from hw
+ */
+static int
+ice_dpll_frequency_get(const struct dpll_pin *pin, void *pin_priv,
+		       const struct dpll_device *dpll, void *dpll_priv,
+		       u64 *frequency, struct netlink_ext_ack *extack,
+		       enum ice_dpll_pin_type pin_type)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	*frequency = p->freq;
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_input_frequency_get - input pin callback for get frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: on success holds pin's frequency
+ * @extack: error reporting
+ *
+ * Wraps internal get frequency command of a input pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't get from hw
+ */
+static int
+ice_dpll_input_frequency_get(const struct dpll_pin *pin, void *pin_priv,
+			     const struct dpll_device *dpll, void *dpll_priv,
+			     u64 *frequency, struct netlink_ext_ack *extack)
+{
+	return ice_dpll_frequency_get(pin, pin_priv, dpll, dpll_priv, frequency,
+				      extack, ICE_DPLL_PIN_TYPE_INPUT);
+}
+
+/**
+ * ice_dpll_output_frequency_get - output pin callback for get frequency
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: pointer to dpll
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @frequency: on success holds pin's frequency
+ * @extack: error reporting
+ *
+ * Wraps internal get frequency command of a pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error pin not found or couldn't get from hw
+ */
+static int
+ice_dpll_output_frequency_get(const struct dpll_pin *pin, void *pin_priv,
+			      const struct dpll_device *dpll, void *dpll_priv,
+			      u64 *frequency, struct netlink_ext_ack *extack)
+{
+	return ice_dpll_frequency_get(pin, pin_priv, dpll, dpll_priv, frequency,
+				      extack, ICE_DPLL_PIN_TYPE_OUTPUT);
+}
+
+/**
+ * ice_dpll_pin_enable - enable a pin on dplls
+ * @hw: board private hw structure
+ * @pin: pointer to a pin
+ * @pin_type: type of pin being enabled
+ * @extack: error reporting
+ *
+ * Enable a pin on both dplls. Store current state in pin->flags.
+ *
+ * Context: Called under pf->dplls.lock
+ * Return:
+ * * 0 - OK
+ * * negative - error
+ */
+static int
+ice_dpll_pin_enable(struct ice_hw *hw, struct ice_dpll_pin *pin,
+		    enum ice_dpll_pin_type pin_type,
+		    struct netlink_ext_ack *extack)
+{
+	u8 flags = 0;
+	int ret;
+
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		if (pin->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN)
+			flags |= ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN;
+		flags |= ICE_AQC_SET_CGU_IN_CFG_FLG2_INPUT_EN;
+		ret = ice_aq_set_input_pin_cfg(hw, pin->idx, 0, flags, 0, 0);
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		if (pin->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN)
+			flags |= ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN;
+		flags |= ICE_AQC_SET_CGU_OUT_CFG_OUT_EN;
+		ret = ice_aq_set_output_pin_cfg(hw, pin->idx, flags, 0, 0, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to enable %s pin:%u\n",
+				   ret, ice_aq_str(hw->adminq.sq_last_status),
+				   pin_type_name[pin_type], pin->idx);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_pin_disable - disable a pin on dplls
+ * @hw: board private hw structure
+ * @pin: pointer to a pin
+ * @pin_type: type of pin being disabled
+ * @extack: error reporting
+ *
+ * Disable a pin on both dplls. Store current state in pin->flags.
+ *
+ * Context: Called under pf->dplls.lock
+ * Return:
+ * * 0 - OK
+ * * negative - error
+ */
+static int
+ice_dpll_pin_disable(struct ice_hw *hw, struct ice_dpll_pin *pin,
+		     enum ice_dpll_pin_type pin_type,
+		     struct netlink_ext_ack *extack)
+{
+	u8 flags = 0;
+	int ret;
+
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		if (pin->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN)
+			flags |= ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN;
+		ret = ice_aq_set_input_pin_cfg(hw, pin->idx, 0, flags, 0, 0);
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		if (pin->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN)
+			flags |= ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN;
+		ret = ice_aq_set_output_pin_cfg(hw, pin->idx, flags, 0, 0, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to disable %s pin:%u\n",
+				   ret, ice_aq_str(hw->adminq.sq_last_status),
+				   pin_type_name[pin_type], pin->idx);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_pin_state_update - update pin's state
+ * @pf: private board struct
+ * @pin: structure with pin attributes to be updated
+ * @pin_type: type of pin being updated
+ * @extack: error reporting
+ *
+ * Determine pin current state and frequency, then update struct
+ * holding the pin info. For input pin states are separated for each
+ * dpll, for rclk pins states are separated for each parent.
+ *
+ * Context: Called under pf->dplls.lock
+ * Return:
+ * * 0 - OK
+ * * negative - error
+ */
+static int
+ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
+			  enum ice_dpll_pin_type pin_type,
+			  struct netlink_ext_ack *extack)
+{
+	u8 parent, port_num = ICE_AQC_SET_PHY_REC_CLK_OUT_CURR_PORT;
+	int ret;
+
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		ret = ice_aq_get_input_pin_cfg(&pf->hw, pin->idx, NULL, NULL,
+					       NULL, &pin->flags[0],
+					       &pin->freq, NULL);
+		if (ret)
+			goto err;
+		if (ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN & pin->flags[0]) {
+			if (pin->pin) {
+				pin->state[pf->dplls.eec.dpll_idx] =
+					pin->pin == pf->dplls.eec.active_input ?
+					DPLL_PIN_STATE_CONNECTED :
+					DPLL_PIN_STATE_SELECTABLE;
+				pin->state[pf->dplls.pps.dpll_idx] =
+					pin->pin == pf->dplls.pps.active_input ?
+					DPLL_PIN_STATE_CONNECTED :
+					DPLL_PIN_STATE_SELECTABLE;
+			} else {
+				pin->state[pf->dplls.eec.dpll_idx] =
+					DPLL_PIN_STATE_SELECTABLE;
+				pin->state[pf->dplls.pps.dpll_idx] =
+					DPLL_PIN_STATE_SELECTABLE;
+			}
+		} else {
+			pin->state[pf->dplls.eec.dpll_idx] =
+				DPLL_PIN_STATE_DISCONNECTED;
+			pin->state[pf->dplls.pps.dpll_idx] =
+				DPLL_PIN_STATE_DISCONNECTED;
+		}
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		ret = ice_aq_get_output_pin_cfg(&pf->hw, pin->idx,
+						&pin->flags[0], NULL,
+						&pin->freq, NULL);
+		if (ret)
+			goto err;
+		if (ICE_AQC_SET_CGU_OUT_CFG_OUT_EN & pin->flags[0])
+			pin->state[0] = DPLL_PIN_STATE_CONNECTED;
+		else
+			pin->state[0] = DPLL_PIN_STATE_DISCONNECTED;
+		break;
+	case ICE_DPLL_PIN_TYPE_RCLK_INPUT:
+		for (parent = 0; parent < pf->dplls.rclk.num_parents;
+		     parent++) {
+			u8 p = parent;
+
+			ret = ice_aq_get_phy_rec_clk_out(&pf->hw, &p,
+							 &port_num,
+							 &pin->flags[parent],
+							 NULL);
+			if (ret)
+				goto err;
+			if (ICE_AQC_GET_PHY_REC_CLK_OUT_OUT_EN &
+			    pin->flags[parent])
+				pin->state[parent] = DPLL_PIN_STATE_CONNECTED;
+			else
+				pin->state[parent] =
+					DPLL_PIN_STATE_DISCONNECTED;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+err:
+	if (extack)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to update %s pin:%u\n",
+				   ret,
+				   ice_aq_str(pf->hw.adminq.sq_last_status),
+				   pin_type_name[pin_type], pin->idx);
+	else
+		dev_err_ratelimited(ice_pf_to_dev(pf),
+				    "err:%d %s failed to update %s pin:%u\n",
+				    ret,
+				    ice_aq_str(pf->hw.adminq.sq_last_status),
+				    pin_type_name[pin_type], pin->idx);
+	return ret;
+}
+
+/**
+ * ice_dpll_hw_input_prio_set - set input priority value in hardware
+ * @pf: board private structure
+ * @dpll: ice dpll pointer
+ * @pin: ice pin pointer
+ * @prio: priority value being set on a dpll
+ * @extack: error reporting
+ *
+ * Internal wrapper for setting the priority in the hardware.
+ *
+ * Context: Called under pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_hw_input_prio_set(struct ice_pf *pf, struct ice_dpll *dpll,
+			   struct ice_dpll_pin *pin, const u32 prio,
+			   struct netlink_ext_ack *extack)
+{
+	int ret;
+
+	ret = ice_aq_set_cgu_ref_prio(&pf->hw, dpll->dpll_idx, pin->idx,
+				      (u8)prio);
+	if (ret)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to set pin prio:%u on pin:%u\n",
+				   ret,
+				   ice_aq_str(pf->hw.adminq.sq_last_status),
+				   prio, pin->idx);
+	else
+		dpll->input_prio[pin->idx] = prio;
+
+	return ret;
+}
+
+/**
+ * ice_dpll_lock_status_get - get dpll lock status callback
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @status: on success holds dpll's lock status
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback, provides dpll's lock status.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_lock_status_get(const struct dpll_device *dpll, void *dpll_priv,
+			 enum dpll_lock_status *status,
+			 struct netlink_ext_ack *extack)
+{
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	*status = d->dpll_state;
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_mode_supported - check if dpll's working mode is supported
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @mode: mode to be checked for support
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Provides information if working mode is supported
+ * by dpll.
+ *
+ * Return:
+ * * true - mode is supported
+ * * false - mode is not supported
+ */
+static bool ice_dpll_mode_supported(const struct dpll_device *dpll,
+				    void *dpll_priv,
+				    enum dpll_mode mode,
+				    struct netlink_ext_ack *extack)
+{
+	if (mode == DPLL_MODE_AUTOMATIC)
+		return true;
+
+	return false;
+}
+
+/**
+ * ice_dpll_mode_get - get dpll's working mode
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @mode: on success holds current working mode of dpll
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Provides working mode of dpll.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int ice_dpll_mode_get(const struct dpll_device *dpll, void *dpll_priv,
+			     enum dpll_mode *mode,
+			     struct netlink_ext_ack *extack)
+{
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	*mode = d->mode;
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_pin_state_set - set pin's state on dpll
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @enable: if pin shalll be enabled
+ * @extack: error reporting
+ * @pin_type: type of a pin
+ *
+ * Set pin state on a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - OK or no change required
+ * * negative - error
+ */
+static int
+ice_dpll_pin_state_set(const struct dpll_pin *pin, void *pin_priv,
+		       const struct dpll_device *dpll, void *dpll_priv,
+		       bool enable, struct netlink_ext_ack *extack,
+		       enum ice_dpll_pin_type pin_type)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+	int ret;
+
+	mutex_lock(&pf->dplls.lock);
+	if (enable)
+		ret = ice_dpll_pin_enable(&pf->hw, p, pin_type, extack);
+	else
+		ret = ice_dpll_pin_disable(&pf->hw, p, pin_type, extack);
+	if (!ret)
+		ret = ice_dpll_pin_state_update(pf, p, pin_type, extack);
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_output_state_set - enable/disable output pin on dpll device
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: dpll being configured
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @state: state of pin to be set
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Set given state on output type pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - successfully enabled mode
+ * * negative - failed to enable mode
+ */
+static int
+ice_dpll_output_state_set(const struct dpll_pin *pin, void *pin_priv,
+			  const struct dpll_device *dpll, void *dpll_priv,
+			  enum dpll_pin_state state,
+			  struct netlink_ext_ack *extack)
+{
+	bool enable = state == DPLL_PIN_STATE_CONNECTED;
+
+	return ice_dpll_pin_state_set(pin, pin_priv, dpll, dpll_priv, enable,
+				      extack, ICE_DPLL_PIN_TYPE_OUTPUT);
+}
+
+/**
+ * ice_dpll_input_state_set - enable/disable input pin on dpll levice
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: dpll being configured
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @state: state of pin to be set
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Enables given mode on input type pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - successfully enabled mode
+ * * negative - failed to enable mode
+ */
+static int
+ice_dpll_input_state_set(const struct dpll_pin *pin, void *pin_priv,
+			 const struct dpll_device *dpll, void *dpll_priv,
+			 enum dpll_pin_state state,
+			 struct netlink_ext_ack *extack)
+{
+	bool enable = state == DPLL_PIN_STATE_SELECTABLE;
+
+	return ice_dpll_pin_state_set(pin, pin_priv, dpll, dpll_priv, enable,
+				      extack, ICE_DPLL_PIN_TYPE_INPUT);
+}
+
+/**
+ * ice_dpll_pin_state_get - set pin's state on dpll
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @state: on success holds state of the pin
+ * @extack: error reporting
+ * @pin_type: type of questioned pin
+ *
+ * Determine pin state set it on a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failed to get state
+ */
+static int
+ice_dpll_pin_state_get(const struct dpll_pin *pin, void *pin_priv,
+		       const struct dpll_device *dpll, void *dpll_priv,
+		       enum dpll_pin_state *state,
+		       struct netlink_ext_ack *extack,
+		       enum ice_dpll_pin_type pin_type)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+	int ret;
+
+	mutex_lock(&pf->dplls.lock);
+	ret = ice_dpll_pin_state_update(pf, p, pin_type, extack);
+	if (ret)
+		goto unlock;
+	if (pin_type == ICE_DPLL_PIN_TYPE_INPUT)
+		*state = p->state[d->dpll_idx];
+	else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT)
+		*state = p->state[0];
+	ret = 0;
+unlock:
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_output_state_get - get output pin state on dpll device
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @state: on success holds state of the pin
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Check state of a pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failed to get state
+ */
+static int
+ice_dpll_output_state_get(const struct dpll_pin *pin, void *pin_priv,
+			  const struct dpll_device *dpll, void *dpll_priv,
+			  enum dpll_pin_state *state,
+			  struct netlink_ext_ack *extack)
+{
+	return ice_dpll_pin_state_get(pin, pin_priv, dpll, dpll_priv, state,
+				      extack, ICE_DPLL_PIN_TYPE_OUTPUT);
+}
+
+/**
+ * ice_dpll_input_state_get - get input pin state on dpll device
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @state: on success holds state of the pin
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Check state of a input pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failed to get state
+ */
+static int
+ice_dpll_input_state_get(const struct dpll_pin *pin, void *pin_priv,
+			 const struct dpll_device *dpll, void *dpll_priv,
+			 enum dpll_pin_state *state,
+			 struct netlink_ext_ack *extack)
+{
+	return ice_dpll_pin_state_get(pin, pin_priv, dpll, dpll_priv, state,
+				      extack, ICE_DPLL_PIN_TYPE_INPUT);
+}
+
+/**
+ * ice_dpll_input_prio_get - get dpll's input prio
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @prio: on success - returns input priority on dpll
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for getting priority of a input pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_input_prio_get(const struct dpll_pin *pin, void *pin_priv,
+			const struct dpll_device *dpll, void *dpll_priv,
+			u32 *prio, struct netlink_ext_ack *extack)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	*prio = d->input_prio[p->idx];
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_input_prio_set - set dpll input prio
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @prio: input priority to be set on dpll
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for setting priority of a input pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_input_prio_set(const struct dpll_pin *pin, void *pin_priv,
+			const struct dpll_device *dpll, void *dpll_priv,
+			u32 prio, struct netlink_ext_ack *extack)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+	int ret;
+
+	if (prio > ICE_DPLL_PRIO_MAX) {
+		NL_SET_ERR_MSG_FMT(extack, "prio out of supported range 0-%d",
+				   ICE_DPLL_PRIO_MAX);
+		return -EINVAL;
+	}
+
+	mutex_lock(&pf->dplls.lock);
+	ret = ice_dpll_hw_input_prio_set(pf, d, p, prio, extack);
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_input_direction - callback for get input pin direction
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @direction: holds input pin direction
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for getting direction of a input pin.
+ *
+ * Return:
+ * * 0 - success
+ */
+static int
+ice_dpll_input_direction(const struct dpll_pin *pin, void *pin_priv,
+			 const struct dpll_device *dpll, void *dpll_priv,
+			 enum dpll_pin_direction *direction,
+			 struct netlink_ext_ack *extack)
+{
+	*direction = DPLL_PIN_DIRECTION_INPUT;
+
+	return 0;
+}
+
+/**
+ * ice_dpll_output_direction - callback for get output pin direction
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @direction: holds output pin direction
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for getting direction of an output pin.
+ *
+ * Return:
+ * * 0 - success
+ */
+static int
+ice_dpll_output_direction(const struct dpll_pin *pin, void *pin_priv,
+			  const struct dpll_device *dpll, void *dpll_priv,
+			  enum dpll_pin_direction *direction,
+			  struct netlink_ext_ack *extack)
+{
+	*direction = DPLL_PIN_DIRECTION_OUTPUT;
+
+	return 0;
+}
+
+/**
+ * ice_dpll_rclk_state_on_pin_set - set a state on rclk pin
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @parent_pin: pin parent pointer
+ * @parent_pin_priv: parent private data pointer passed on pin registration
+ * @state: state to be set on pin
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback, set a state of a rclk pin on a parent pin
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_rclk_state_on_pin_set(const struct dpll_pin *pin, void *pin_priv,
+			       const struct dpll_pin *parent_pin,
+			       void *parent_pin_priv,
+			       enum dpll_pin_state state,
+			       struct netlink_ext_ack *extack)
+{
+	struct ice_dpll_pin *p = pin_priv, *parent = parent_pin_priv;
+	bool enable = state == DPLL_PIN_STATE_CONNECTED;
+	struct ice_pf *pf = p->pf;
+	int ret = -EINVAL;
+	u32 hw_idx;
+
+	mutex_lock(&pf->dplls.lock);
+	hw_idx = parent->idx - pf->dplls.base_rclk_idx;
+	if (hw_idx >= pf->dplls.num_inputs)
+		goto unlock;
+
+	if ((enable && p->state[hw_idx] == DPLL_PIN_STATE_CONNECTED) ||
+	    (!enable && p->state[hw_idx] == DPLL_PIN_STATE_DISCONNECTED)) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "pin:%u state:%u on parent:%u already set",
+				   p->idx, state, parent->idx);
+		goto unlock;
+	}
+	ret = ice_aq_set_phy_rec_clk_out(&pf->hw, hw_idx, enable,
+					 &p->freq);
+	if (ret)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to set pin state:%u for pin:%u on parent:%u\n",
+				   ret,
+				   ice_aq_str(pf->hw.adminq.sq_last_status),
+				   state, p->idx, parent->idx);
+unlock:
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_rclk_state_on_pin_get - get a state of rclk pin
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @parent_pin: pin parent pointer
+ * @parent_pin_priv: pin parent priv data pointer passed on pin registration
+ * @state: on success holds pin state on parent pin
+ * @extack: error reporting
+ *
+ * dpll subsystem callback, get a state of a recovered clock pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - failure
+ */
+static int
+ice_dpll_rclk_state_on_pin_get(const struct dpll_pin *pin, void *pin_priv,
+			       const struct dpll_pin *parent_pin,
+			       void *parent_pin_priv,
+			       enum dpll_pin_state *state,
+			       struct netlink_ext_ack *extack)
+{
+	struct ice_dpll_pin *p = pin_priv, *parent = parent_pin_priv;
+	struct ice_pf *pf = p->pf;
+	int ret = -EINVAL;
+	u32 hw_idx;
+
+	mutex_lock(&pf->dplls.lock);
+	hw_idx = parent->idx - pf->dplls.base_rclk_idx;
+	if (hw_idx >= pf->dplls.num_inputs)
+		goto unlock;
+
+	ret = ice_dpll_pin_state_update(pf, p, ICE_DPLL_PIN_TYPE_RCLK_INPUT,
+					extack);
+	if (ret)
+		goto unlock;
+
+	*state = p->state[hw_idx];
+	ret = 0;
+unlock:
+	mutex_unlock(&pf->dplls.lock);
+
+	return ret;
+}
+
+static const struct dpll_pin_ops ice_dpll_rclk_ops = {
+	.state_on_pin_set = ice_dpll_rclk_state_on_pin_set,
+	.state_on_pin_get = ice_dpll_rclk_state_on_pin_get,
+	.direction_get = ice_dpll_input_direction,
+};
+
+static const struct dpll_pin_ops ice_dpll_input_ops = {
+	.frequency_get = ice_dpll_input_frequency_get,
+	.frequency_set = ice_dpll_input_frequency_set,
+	.state_on_dpll_get = ice_dpll_input_state_get,
+	.state_on_dpll_set = ice_dpll_input_state_set,
+	.prio_get = ice_dpll_input_prio_get,
+	.prio_set = ice_dpll_input_prio_set,
+	.direction_get = ice_dpll_input_direction,
+};
+
+static const struct dpll_pin_ops ice_dpll_output_ops = {
+	.frequency_get = ice_dpll_output_frequency_get,
+	.frequency_set = ice_dpll_output_frequency_set,
+	.state_on_dpll_get = ice_dpll_output_state_get,
+	.state_on_dpll_set = ice_dpll_output_state_set,
+	.direction_get = ice_dpll_output_direction,
+};
+
+static const struct dpll_device_ops ice_dpll_ops = {
+	.lock_status_get = ice_dpll_lock_status_get,
+	.mode_supported = ice_dpll_mode_supported,
+	.mode_get = ice_dpll_mode_get,
+};
+
+/**
+ * ice_generate_clock_id - generates unique clock_id for registering dpll.
+ * @pf: board private structure
+ *
+ * Generates unique (per board) clock_id for allocation and search of dpll
+ * devices in Linux dpll subsystem.
+ *
+ * Return: generated clock id for the board
+ */
+static u64 ice_generate_clock_id(struct ice_pf *pf)
+{
+	return pci_get_dsn(pf->pdev);
+}
+
+/**
+ * ice_dpll_notify_changes - notify dpll subsystem about changes
+ * @d: pointer do dpll
+ *
+ * Once change detected appropriate event is submitted to the dpll subsystem.
+ */
+static void ice_dpll_notify_changes(struct ice_dpll *d)
+{
+	if (d->prev_dpll_state != d->dpll_state) {
+		d->prev_dpll_state = d->dpll_state;
+		dpll_device_change_ntf(d->dpll);
+	}
+	if (d->prev_input != d->active_input) {
+		if (d->prev_input)
+			dpll_pin_change_ntf(d->prev_input);
+		d->prev_input = d->active_input;
+		if (d->active_input)
+			dpll_pin_change_ntf(d->active_input);
+	}
+}
+
+/**
+ * ice_dpll_update_state - update dpll state
+ * @pf: pf private structure
+ * @d: pointer to queried dpll device
+ * @init: if function called on initialization of ice dpll
+ *
+ * Poll current state of dpll from hw and update ice_dpll struct.
+ *
+ * Context: Called by kworker under pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - AQ failure
+ */
+static int
+ice_dpll_update_state(struct ice_pf *pf, struct ice_dpll *d, bool init)
+{
+	struct ice_dpll_pin *p = NULL;
+	int ret;
+
+	ret = ice_get_cgu_state(&pf->hw, d->dpll_idx, d->prev_dpll_state,
+				&d->input_idx, &d->ref_state, &d->eec_mode,
+				&d->phase_shift, &d->dpll_state);
+
+	dev_dbg(ice_pf_to_dev(pf),
+		"update dpll=%d, prev_src_idx:%u, src_idx:%u, state:%d, prev:%d mode:%d\n",
+		d->dpll_idx, d->prev_input_idx, d->input_idx,
+		d->dpll_state, d->prev_dpll_state, d->mode);
+	if (ret) {
+		dev_err(ice_pf_to_dev(pf),
+			"update dpll=%d state failed, ret=%d %s\n",
+			d->dpll_idx, ret,
+			ice_aq_str(pf->hw.adminq.sq_last_status));
+		return ret;
+	}
+	if (init) {
+		if (d->dpll_state == DPLL_LOCK_STATUS_LOCKED ||
+		    d->dpll_state == DPLL_LOCK_STATUS_LOCKED_HO_ACQ)
+			d->active_input = pf->dplls.inputs[d->input_idx].pin;
+		p = &pf->dplls.inputs[d->input_idx];
+		return ice_dpll_pin_state_update(pf, p,
+						 ICE_DPLL_PIN_TYPE_INPUT, NULL);
+	}
+	if (d->dpll_state == DPLL_LOCK_STATUS_HOLDOVER ||
+	    d->dpll_state == DPLL_LOCK_STATUS_UNLOCKED) {
+		d->active_input = NULL;
+		if (d->input_idx != ICE_DPLL_PIN_IDX_INVALID)
+			p = &pf->dplls.inputs[d->input_idx];
+		d->prev_input_idx = ICE_DPLL_PIN_IDX_INVALID;
+		d->input_idx = ICE_DPLL_PIN_IDX_INVALID;
+		if (!p)
+			return 0;
+		ret = ice_dpll_pin_state_update(pf, p,
+						ICE_DPLL_PIN_TYPE_INPUT, NULL);
+	} else if (d->input_idx != d->prev_input_idx) {
+		if (d->prev_input_idx != ICE_DPLL_PIN_IDX_INVALID) {
+			p = &pf->dplls.inputs[d->prev_input_idx];
+			ice_dpll_pin_state_update(pf, p,
+						  ICE_DPLL_PIN_TYPE_INPUT,
+						  NULL);
+		}
+		if (d->input_idx != ICE_DPLL_PIN_IDX_INVALID) {
+			p = &pf->dplls.inputs[d->input_idx];
+			d->active_input = p->pin;
+			ice_dpll_pin_state_update(pf, p,
+						  ICE_DPLL_PIN_TYPE_INPUT,
+						  NULL);
+		}
+		d->prev_input_idx = d->input_idx;
+	}
+
+	return ret;
+}
+
+/**
+ * ice_dpll_periodic_work - DPLLs periodic worker
+ * @work: pointer to kthread_work structure
+ *
+ * DPLLs periodic worker is responsible for polling state of dpll.
+ * Context: Holds pf->dplls.lock
+ */
+static void ice_dpll_periodic_work(struct kthread_work *work)
+{
+	struct ice_dplls *d = container_of(work, struct ice_dplls, work.work);
+	struct ice_pf *pf = container_of(d, struct ice_pf, dplls);
+	struct ice_dpll *de = &pf->dplls.eec;
+	struct ice_dpll *dp = &pf->dplls.pps;
+	int ret;
+
+	mutex_lock(&pf->dplls.lock);
+	ret = ice_dpll_update_state(pf, de, false);
+	if (!ret)
+		ret = ice_dpll_update_state(pf, dp, false);
+	if (ret) {
+		d->cgu_state_acq_err_num++;
+		/* stop rescheduling this worker */
+		if (d->cgu_state_acq_err_num >
+		    ICE_CGU_STATE_ACQ_ERR_THRESHOLD) {
+			dev_err(ice_pf_to_dev(pf),
+				"EEC/PPS DPLLs periodic work disabled\n");
+			mutex_unlock(&pf->dplls.lock);
+			return;
+		}
+	}
+	mutex_unlock(&pf->dplls.lock);
+	ice_dpll_notify_changes(de);
+	ice_dpll_notify_changes(dp);
+
+	/* Run twice a second or reschedule if update failed */
+	kthread_queue_delayed_work(d->kworker, &d->work,
+				   ret ? msecs_to_jiffies(10) :
+				   msecs_to_jiffies(500));
+}
+
+/**
+ * ice_dpll_release_pins - release pins resources from dpll subsystem
+ * @pins: pointer to pins array
+ * @count: number of pins
+ *
+ * Release resources of given pins array in the dpll subsystem.
+ */
+static void ice_dpll_release_pins(struct ice_dpll_pin *pins, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		dpll_pin_put(pins[i].pin);
+}
+
+/**
+ * ice_dpll_get_pins - get pins from dpll subsystem
+ * @pf: board private structure
+ * @pins: pointer to pins array
+ * @start_idx: get starts from this pin idx value
+ * @count: number of pins
+ * @clock_id: clock_id of dpll device
+ *
+ * Get pins - allocate - in dpll subsystem, store them in pin field of given
+ * pins array.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - allocation failure reason
+ */
+static int
+ice_dpll_get_pins(struct ice_pf *pf, struct ice_dpll_pin *pins,
+		  int start_idx, int count, u64 clock_id)
+{
+	int i, ret;
+
+	for (i = 0; i < count; i++) {
+		pins[i].pin = dpll_pin_get(clock_id, i + start_idx, THIS_MODULE,
+					   &pins[i].prop);
+		if (IS_ERR(pins[i].pin)) {
+			ret = PTR_ERR(pins[i].pin);
+			goto release_pins;
+		}
+	}
+
+	return 0;
+
+release_pins:
+	while (--i >= 0)
+		dpll_pin_put(pins[i].pin);
+	return ret;
+}
+
+/**
+ * ice_dpll_unregister_pins - unregister pins from a dpll
+ * @dpll: dpll device pointer
+ * @pins: pointer to pins array
+ * @ops: callback ops registered with the pins
+ * @count: number of pins
+ *
+ * Unregister pins of a given array of pins from given dpll device registered in
+ * dpll subsystem.
+ */
+static void
+ice_dpll_unregister_pins(struct dpll_device *dpll, struct ice_dpll_pin *pins,
+			 const struct dpll_pin_ops *ops, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		dpll_pin_unregister(dpll, pins[i].pin, ops, &pins[i]);
+}
+
+/**
+ * ice_dpll_register_pins - register pins with a dpll
+ * @dpll: dpll pointer to register pins with
+ * @pins: pointer to pins array
+ * @ops: callback ops registered with the pins
+ * @count: number of pins
+ *
+ * Register pins of a given array with given dpll in dpll subsystem.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - registration failure reason
+ */
+static int
+ice_dpll_register_pins(struct dpll_device *dpll, struct ice_dpll_pin *pins,
+		       const struct dpll_pin_ops *ops, int count)
+{
+	int ret, i;
+
+	for (i = 0; i < count; i++) {
+		ret = dpll_pin_register(dpll, pins[i].pin, ops, &pins[i]);
+		if (ret)
+			goto unregister_pins;
+	}
+
+	return 0;
+
+unregister_pins:
+	while (--i >= 0)
+		dpll_pin_unregister(dpll, pins[i].pin, ops, &pins[i]);
+	return ret;
+}
+
+/**
+ * ice_dpll_deinit_direct_pins - deinitialize direct pins
+ * @cgu: if cgu is present and controlled by this NIC
+ * @pins: pointer to pins array
+ * @count: number of pins
+ * @ops: callback ops registered with the pins
+ * @first: dpll device pointer
+ * @second: dpll device pointer
+ *
+ * If cgu is owned unregister pins from given dplls.
+ * Release pins resources to the dpll subsystem.
+ */
+static void
+ice_dpll_deinit_direct_pins(bool cgu, struct ice_dpll_pin *pins, int count,
+			    const struct dpll_pin_ops *ops,
+			    struct dpll_device *first,
+			    struct dpll_device *second)
+{
+	if (cgu) {
+		ice_dpll_unregister_pins(first, pins, ops, count);
+		ice_dpll_unregister_pins(second, pins, ops, count);
+	}
+	ice_dpll_release_pins(pins, count);
+}
+
+/**
+ * ice_dpll_init_direct_pins - initialize direct pins
+ * @pf: board private structure
+ * @cgu: if cgu is present and controlled by this NIC
+ * @pins: pointer to pins array
+ * @start_idx: on which index shall allocation start in dpll subsystem
+ * @count: number of pins
+ * @ops: callback ops registered with the pins
+ * @first: dpll device pointer
+ * @second: dpll device pointer
+ *
+ * Allocate directly connected pins of a given array in dpll subsystem.
+ * If cgu is owned register allocated pins with given dplls.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - registration failure reason
+ */
+static int
+ice_dpll_init_direct_pins(struct ice_pf *pf, bool cgu,
+			  struct ice_dpll_pin *pins, int start_idx, int count,
+			  const struct dpll_pin_ops *ops,
+			  struct dpll_device *first, struct dpll_device *second)
+{
+	int ret;
+
+	ret = ice_dpll_get_pins(pf, pins, start_idx, count, pf->dplls.clock_id);
+	if (ret)
+		return ret;
+	if (cgu) {
+		ret = ice_dpll_register_pins(first, pins, ops, count);
+		if (ret)
+			goto release_pins;
+		ret = ice_dpll_register_pins(second, pins, ops, count);
+		if (ret)
+			goto unregister_first;
+	}
+
+	return 0;
+
+unregister_first:
+	ice_dpll_unregister_pins(first, pins, ops, count);
+release_pins:
+	ice_dpll_release_pins(pins, count);
+	return ret;
+}
+
+/**
+ * ice_dpll_deinit_rclk_pin - release rclk pin resources
+ * @pf: board private structure
+ *
+ * Deregister rclk pin from parent pins and release resources in dpll subsystem.
+ */
+static void ice_dpll_deinit_rclk_pin(struct ice_pf *pf)
+{
+	struct ice_dpll_pin *rclk = &pf->dplls.rclk;
+	struct ice_vsi *vsi = ice_get_main_vsi(pf);
+	struct dpll_pin *parent;
+	int i;
+
+	for (i = 0; i < rclk->num_parents; i++) {
+		parent = pf->dplls.inputs[rclk->parent_idx[i]].pin;
+		if (!parent)
+			continue;
+		dpll_pin_on_pin_unregister(parent, rclk->pin,
+					   &ice_dpll_rclk_ops, rclk);
+	}
+	if (WARN_ON_ONCE(!vsi || !vsi->netdev))
+		return;
+	netdev_dpll_pin_clear(vsi->netdev);
+	dpll_pin_put(rclk->pin);
+}
+
+/**
+ * ice_dpll_init_rclk_pins - initialize recovered clock pin
+ * @pf: board private structure
+ * @pin: pin to register
+ * @start_idx: on which index shall allocation start in dpll subsystem
+ * @ops: callback ops registered with the pins
+ *
+ * Allocate resource for recovered clock pin in dpll subsystem. Register the
+ * pin with the parents it has in the info. Register pin with the pf's main vsi
+ * netdev.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - registration failure reason
+ */
+static int
+ice_dpll_init_rclk_pins(struct ice_pf *pf, struct ice_dpll_pin *pin,
+			int start_idx, const struct dpll_pin_ops *ops)
+{
+	struct ice_vsi *vsi = ice_get_main_vsi(pf);
+	struct dpll_pin *parent;
+	int ret, i;
+
+	ret = ice_dpll_get_pins(pf, pin, start_idx, ICE_DPLL_RCLK_NUM_PER_PF,
+				pf->dplls.clock_id);
+	if (ret)
+		return ret;
+	for (i = 0; i < pf->dplls.rclk.num_parents; i++) {
+		parent = pf->dplls.inputs[pf->dplls.rclk.parent_idx[i]].pin;
+		if (!parent) {
+			ret = -ENODEV;
+			goto unregister_pins;
+		}
+		ret = dpll_pin_on_pin_register(parent, pf->dplls.rclk.pin,
+					       ops, &pf->dplls.rclk);
+		if (ret)
+			goto unregister_pins;
+	}
+	if (WARN_ON((!vsi || !vsi->netdev)))
+		return -EINVAL;
+	netdev_dpll_pin_set(vsi->netdev, pf->dplls.rclk.pin);
+
+	return 0;
+
+unregister_pins:
+	while (i) {
+		parent = pf->dplls.inputs[pf->dplls.rclk.parent_idx[--i]].pin;
+		dpll_pin_on_pin_unregister(parent, pf->dplls.rclk.pin,
+					   &ice_dpll_rclk_ops, &pf->dplls.rclk);
+	}
+	ice_dpll_release_pins(pin, ICE_DPLL_RCLK_NUM_PER_PF);
+	return ret;
+}
+
+/**
+ * ice_dpll_deinit_pins - deinitialize direct pins
+ * @pf: board private structure
+ * @cgu: if cgu is controlled by this pf
+ *
+ * If cgu is owned unregister directly connected pins from the dplls.
+ * Release resources of directly connected pins from the dpll subsystem.
+ */
+static void ice_dpll_deinit_pins(struct ice_pf *pf, bool cgu)
+{
+	struct ice_dpll_pin *outputs = pf->dplls.outputs;
+	struct ice_dpll_pin *inputs = pf->dplls.inputs;
+	int num_outputs = pf->dplls.num_outputs;
+	int num_inputs = pf->dplls.num_inputs;
+	struct ice_dplls *d = &pf->dplls;
+	struct ice_dpll *de = &d->eec;
+	struct ice_dpll *dp = &d->pps;
+
+	ice_dpll_deinit_rclk_pin(pf);
+	if (cgu) {
+		ice_dpll_unregister_pins(dp->dpll, inputs, &ice_dpll_input_ops,
+					 num_inputs);
+		ice_dpll_unregister_pins(de->dpll, inputs, &ice_dpll_input_ops,
+					 num_inputs);
+	}
+	ice_dpll_release_pins(inputs, num_inputs);
+	if (cgu) {
+		ice_dpll_unregister_pins(dp->dpll, outputs,
+					 &ice_dpll_output_ops, num_outputs);
+		ice_dpll_unregister_pins(de->dpll, outputs,
+					 &ice_dpll_output_ops, num_outputs);
+		ice_dpll_release_pins(outputs, num_outputs);
+	}
+}
+
+/**
+ * ice_dpll_init_pins - init pins and register pins with a dplls
+ * @pf: board private structure
+ * @cgu: if cgu is present and controlled by this NIC
+ *
+ * Initialize directly connected pf's pins within pf's dplls in a Linux dpll
+ * subsystem.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - initialization failure reason
+ */
+static int ice_dpll_init_pins(struct ice_pf *pf, bool cgu)
+{
+	u32 rclk_idx;
+	int ret;
+
+	ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.inputs, 0,
+					pf->dplls.num_inputs,
+					&ice_dpll_input_ops,
+					pf->dplls.eec.dpll, pf->dplls.pps.dpll);
+	if (ret)
+		return ret;
+	if (cgu) {
+		ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.outputs,
+						pf->dplls.num_inputs,
+						pf->dplls.num_outputs,
+						&ice_dpll_output_ops,
+						pf->dplls.eec.dpll,
+						pf->dplls.pps.dpll);
+		if (ret)
+			goto deinit_inputs;
+	}
+	rclk_idx = pf->dplls.num_inputs + pf->dplls.num_outputs + pf->hw.pf_id;
+	ret = ice_dpll_init_rclk_pins(pf, &pf->dplls.rclk, rclk_idx,
+				      &ice_dpll_rclk_ops);
+	if (ret)
+		goto deinit_outputs;
+
+	return 0;
+deinit_outputs:
+	ice_dpll_deinit_direct_pins(cgu, pf->dplls.outputs,
+				    pf->dplls.num_outputs,
+				    &ice_dpll_output_ops, pf->dplls.pps.dpll,
+				    pf->dplls.eec.dpll);
+deinit_inputs:
+	ice_dpll_deinit_direct_pins(cgu, pf->dplls.inputs, pf->dplls.num_inputs,
+				    &ice_dpll_input_ops, pf->dplls.pps.dpll,
+				    pf->dplls.eec.dpll);
+	return ret;
+}
+
+/**
+ * ice_dpll_deinit_dpll - deinitialize dpll device
+ * @pf: board private structure
+ * @d: pointer to ice_dpll
+ * @cgu: if cgu is present and controlled by this NIC
+ *
+ * If cgu is owned unregister the dpll from dpll subsystem.
+ * Release resources of dpll device from dpll subsystem.
+ */
+static void
+ice_dpll_deinit_dpll(struct ice_pf *pf, struct ice_dpll *d, bool cgu)
+{
+	if (cgu)
+		dpll_device_unregister(d->dpll, &ice_dpll_ops, d);
+	dpll_device_put(d->dpll);
+}
+
+/**
+ * ice_dpll_init_dpll - initialize dpll device in dpll subsystem
+ * @pf: board private structure
+ * @d: dpll to be initialized
+ * @cgu: if cgu is present and controlled by this NIC
+ * @type: type of dpll being initialized
+ *
+ * Allocate dpll instance for this board in dpll subsystem, if cgu is controlled
+ * by this NIC, register dpll with the callback ops.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - initialization failure reason
+ */
+static int
+ice_dpll_init_dpll(struct ice_pf *pf, struct ice_dpll *d, bool cgu,
+		   enum dpll_type type)
+{
+	u64 clock_id = pf->dplls.clock_id;
+	int ret;
+
+	d->dpll = dpll_device_get(clock_id, d->dpll_idx, THIS_MODULE);
+	if (IS_ERR(d->dpll)) {
+		ret = PTR_ERR(d->dpll);
+		dev_err(ice_pf_to_dev(pf),
+			"dpll_device_get failed (%p) err=%d\n", d, ret);
+		return ret;
+	}
+	d->pf = pf;
+	if (cgu) {
+		ret = dpll_device_register(d->dpll, type, &ice_dpll_ops, d);
+		if (ret) {
+			dpll_device_put(d->dpll);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * ice_dpll_deinit_worker - deinitialize dpll kworker
+ * @pf: board private structure
+ *
+ * Stop dpll's kworker, release it's resources.
+ */
+static void ice_dpll_deinit_worker(struct ice_pf *pf)
+{
+	struct ice_dplls *d = &pf->dplls;
+
+	kthread_cancel_delayed_work_sync(&d->work);
+	kthread_destroy_worker(d->kworker);
+}
+
+/**
+ * ice_dpll_init_worker - Initialize DPLLs periodic worker
+ * @pf: board private structure
+ *
+ * Create and start DPLLs periodic worker.
+ *
+ * Context: Shall be called after pf->dplls.lock is initialized.
+ * Return:
+ * * 0 - success
+ * * negative - create worker failure
+ */
+static int ice_dpll_init_worker(struct ice_pf *pf)
+{
+	struct ice_dplls *d = &pf->dplls;
+	struct kthread_worker *kworker;
+
+	ice_dpll_update_state(pf, &d->eec, true);
+	ice_dpll_update_state(pf, &d->pps, true);
+	kthread_init_delayed_work(&d->work, ice_dpll_periodic_work);
+	kworker = kthread_create_worker(0, "ice-dplls-%s",
+					dev_name(ice_pf_to_dev(pf)));
+	if (IS_ERR(kworker))
+		return PTR_ERR(kworker);
+	d->kworker = kworker;
+	d->cgu_state_acq_err_num = 0;
+	kthread_queue_delayed_work(d->kworker, &d->work, 0);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_init_info_direct_pins - initializes direct pins info
+ * @pf: board private structure
+ * @pin_type: type of pins being initialized
+ *
+ * Init information for directly connected pins, cache them in pf's pins
+ * structures.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - init failure reason
+ */
+static int
+ice_dpll_init_info_direct_pins(struct ice_pf *pf,
+			       enum ice_dpll_pin_type pin_type)
+{
+	struct ice_dpll *de = &pf->dplls.eec, *dp = &pf->dplls.pps;
+	int num_pins, i, ret = -EINVAL;
+	struct ice_hw *hw = &pf->hw;
+	struct ice_dpll_pin *pins;
+	u8 freq_supp_num;
+	bool input;
+
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		pins = pf->dplls.inputs;
+		num_pins = pf->dplls.num_inputs;
+		input = true;
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		pins = pf->dplls.outputs;
+		num_pins = pf->dplls.num_outputs;
+		input = false;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_pins; i++) {
+		pins[i].idx = i;
+		pins[i].prop.board_label = ice_cgu_get_pin_name(hw, i, input);
+		pins[i].prop.type = ice_cgu_get_pin_type(hw, i, input);
+		if (input) {
+			ret = ice_aq_get_cgu_ref_prio(hw, de->dpll_idx, i,
+						      &de->input_prio[i]);
+			if (ret)
+				return ret;
+			ret = ice_aq_get_cgu_ref_prio(hw, dp->dpll_idx, i,
+						      &dp->input_prio[i]);
+			if (ret)
+				return ret;
+			pins[i].prop.capabilities |=
+				DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE;
+		}
+		pins[i].prop.capabilities |=
+			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+		ret = ice_dpll_pin_state_update(pf, &pins[i], pin_type, NULL);
+		if (ret)
+			return ret;
+		pins[i].prop.freq_supported =
+			ice_cgu_get_pin_freq_supp(hw, i, input, &freq_supp_num);
+		pins[i].prop.freq_supported_num = freq_supp_num;
+		pins[i].pf = pf;
+	}
+
+	return ret;
+}
+
+/**
+ * ice_dpll_init_info_rclk_pin - initializes rclk pin information
+ * @pf: board private structure
+ *
+ * Init information for rclk pin, cache them in pf->dplls.rclk.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - init failure reason
+ */
+static int ice_dpll_init_info_rclk_pin(struct ice_pf *pf)
+{
+	struct ice_dpll_pin *pin = &pf->dplls.rclk;
+
+	pin->prop.type = DPLL_PIN_TYPE_SYNCE_ETH_PORT;
+	pin->prop.capabilities |= DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+	pin->pf = pf;
+
+	return ice_dpll_pin_state_update(pf, pin,
+					 ICE_DPLL_PIN_TYPE_RCLK_INPUT, NULL);
+}
+
+/**
+ * ice_dpll_init_pins_info - init pins info wrapper
+ * @pf: board private structure
+ * @pin_type: type of pins being initialized
+ *
+ * Wraps functions for pin initialization.
+ *
+ * Return:
+ * * 0 - success
+ * * negative - init failure reason
+ */
+static int
+ice_dpll_init_pins_info(struct ice_pf *pf, enum ice_dpll_pin_type pin_type)
+{
+	switch (pin_type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		return ice_dpll_init_info_direct_pins(pf, pin_type);
+	case ICE_DPLL_PIN_TYPE_RCLK_INPUT:
+		return ice_dpll_init_info_rclk_pin(pf);
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * ice_dpll_deinit_info - release memory allocated for pins info
+ * @pf: board private structure
+ *
+ * Release memory allocated for pins by ice_dpll_init_info function.
+ */
+static void ice_dpll_deinit_info(struct ice_pf *pf)
+{
+	kfree(pf->dplls.inputs);
+	kfree(pf->dplls.outputs);
+	kfree(pf->dplls.eec.input_prio);
+	kfree(pf->dplls.pps.input_prio);
+}
+
+/**
+ * ice_dpll_init_info - prepare pf's dpll information structure
+ * @pf: board private structure
+ * @cgu: if cgu is present and controlled by this NIC
+ *
+ * Acquire (from HW) and set basic dpll information (on pf->dplls struct).
+ *
+ * Return:
+ * * 0 - success
+ * * negative - init failure reason
+ */
+static int ice_dpll_init_info(struct ice_pf *pf, bool cgu)
+{
+	struct ice_aqc_get_cgu_abilities abilities;
+	struct ice_dpll *de = &pf->dplls.eec;
+	struct ice_dpll *dp = &pf->dplls.pps;
+	struct ice_dplls *d = &pf->dplls;
+	struct ice_hw *hw = &pf->hw;
+	int ret, alloc_size, i;
+
+	d->clock_id = ice_generate_clock_id(pf);
+	ret = ice_aq_get_cgu_abilities(hw, &abilities);
+	if (ret) {
+		dev_err(ice_pf_to_dev(pf),
+			"err:%d %s failed to read cgu abilities\n",
+			ret, ice_aq_str(hw->adminq.sq_last_status));
+		return ret;
+	}
+
+	de->dpll_idx = abilities.eec_dpll_idx;
+	dp->dpll_idx = abilities.pps_dpll_idx;
+	d->num_inputs = abilities.num_inputs;
+	d->num_outputs = abilities.num_outputs;
+	d->input_phase_adj_max = le32_to_cpu(abilities.max_in_phase_adj);
+	d->output_phase_adj_max = le32_to_cpu(abilities.max_out_phase_adj);
+
+	alloc_size = sizeof(*d->inputs) * d->num_inputs;
+	d->inputs = kzalloc(alloc_size, GFP_KERNEL);
+	if (!d->inputs)
+		return -ENOMEM;
+
+	alloc_size = sizeof(*de->input_prio) * d->num_inputs;
+	de->input_prio = kzalloc(alloc_size, GFP_KERNEL);
+	if (!de->input_prio)
+		return -ENOMEM;
+
+	dp->input_prio = kzalloc(alloc_size, GFP_KERNEL);
+	if (!dp->input_prio)
+		return -ENOMEM;
+
+	ret = ice_dpll_init_pins_info(pf, ICE_DPLL_PIN_TYPE_INPUT);
+	if (ret)
+		goto deinit_info;
+
+	if (cgu) {
+		alloc_size = sizeof(*d->outputs) * d->num_outputs;
+		d->outputs = kzalloc(alloc_size, GFP_KERNEL);
+		if (!d->outputs) {
+			ret = -ENOMEM;
+			goto deinit_info;
+		}
+
+		ret = ice_dpll_init_pins_info(pf, ICE_DPLL_PIN_TYPE_OUTPUT);
+		if (ret)
+			goto deinit_info;
+	}
+
+	ret = ice_get_cgu_rclk_pin_info(&pf->hw, &d->base_rclk_idx,
+					&pf->dplls.rclk.num_parents);
+	if (ret)
+		return ret;
+	for (i = 0; i < pf->dplls.rclk.num_parents; i++)
+		pf->dplls.rclk.parent_idx[i] = d->base_rclk_idx + i;
+	ret = ice_dpll_init_pins_info(pf, ICE_DPLL_PIN_TYPE_RCLK_INPUT);
+	if (ret)
+		return ret;
+	de->mode = DPLL_MODE_AUTOMATIC;
+	dp->mode = DPLL_MODE_AUTOMATIC;
+
+	dev_dbg(ice_pf_to_dev(pf),
+		"%s - success, inputs:%u, outputs:%u rclk-parents:%u\n",
+		__func__, d->num_inputs, d->num_outputs, d->rclk.num_parents);
+
+	return 0;
+
+deinit_info:
+	dev_err(ice_pf_to_dev(pf),
+		"%s - fail: d->inputs:%p, de->input_prio:%p, dp->input_prio:%p, d->outputs:%p\n",
+		__func__, d->inputs, de->input_prio,
+		dp->input_prio, d->outputs);
+	ice_dpll_deinit_info(pf);
+	return ret;
+}
+
+/**
+ * ice_dpll_deinit - Disable the driver/HW support for dpll subsystem
+ * the dpll device.
+ * @pf: board private structure
+ *
+ * Handles the cleanup work required after dpll initialization, freeing
+ * resources and unregistering the dpll, pin and all resources used for
+ * handling them.
+ *
+ * Context: Destroys pf->dplls.lock mutex. Call only if ICE_FLAG_DPLL was set.
+ */
+void ice_dpll_deinit(struct ice_pf *pf)
+{
+	bool cgu = ice_is_feature_supported(pf, ICE_F_CGU);
+
+	clear_bit(ICE_FLAG_DPLL, pf->flags);
+	if (cgu)
+		ice_dpll_deinit_worker(pf);
+
+	ice_dpll_deinit_pins(pf, cgu);
+	ice_dpll_deinit_dpll(pf, &pf->dplls.pps, cgu);
+	ice_dpll_deinit_dpll(pf, &pf->dplls.eec, cgu);
+	ice_dpll_deinit_info(pf);
+	mutex_destroy(&pf->dplls.lock);
+}
+
+/**
+ * ice_dpll_init - initialize support for dpll subsystem
+ * @pf: board private structure
+ *
+ * Set up the device dplls, register them and pins connected within Linux dpll
+ * subsystem. Allow userspace to obtain state of DPLL and handling of DPLL
+ * configuration requests.
+ *
+ * Context: Initializes pf->dplls.lock mutex.
+ */
+void ice_dpll_init(struct ice_pf *pf)
+{
+	bool cgu = ice_is_feature_supported(pf, ICE_F_CGU);
+	struct ice_dplls *d = &pf->dplls;
+	int err = 0;
+
+	err = ice_dpll_init_info(pf, cgu);
+	if (err)
+		goto err_exit;
+	err = ice_dpll_init_dpll(pf, &pf->dplls.eec, cgu, DPLL_TYPE_EEC);
+	if (err)
+		goto deinit_info;
+	err = ice_dpll_init_dpll(pf, &pf->dplls.pps, cgu, DPLL_TYPE_PPS);
+	if (err)
+		goto deinit_eec;
+	err = ice_dpll_init_pins(pf, cgu);
+	if (err)
+		goto deinit_pps;
+	mutex_init(&d->lock);
+	if (cgu) {
+		err = ice_dpll_init_worker(pf);
+		if (err)
+			goto deinit_pins;
+	}
+	set_bit(ICE_FLAG_DPLL, pf->flags);
+
+	return;
+
+deinit_pins:
+	ice_dpll_deinit_pins(pf, cgu);
+deinit_pps:
+	ice_dpll_deinit_dpll(pf, &pf->dplls.pps, cgu);
+deinit_eec:
+	ice_dpll_deinit_dpll(pf, &pf->dplls.eec, cgu);
+deinit_info:
+	ice_dpll_deinit_info(pf);
+err_exit:
+	mutex_destroy(&d->lock);
+	dev_warn(ice_pf_to_dev(pf), "DPLLs init failure err:%d\n", err);
+}
diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
new file mode 100644
index 000000000000..9c524c4bdfd7
--- /dev/null
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2022, Intel Corporation. */
+
+#ifndef _ICE_DPLL_H_
+#define _ICE_DPLL_H_
+
+#include "ice.h"
+
+#define ICE_DPLL_PRIO_MAX	0xF
+#define ICE_DPLL_RCLK_NUM_MAX	4
+
+/** ice_dpll_pin - store info about pins
+ * @pin: dpll pin structure
+ * @pf: pointer to pf, which has registered the dpll_pin
+ * @idx: ice pin private idx
+ * @num_parents: hols number of parent pins
+ * @parent_idx: hold indexes of parent pins
+ * @flags: pin flags returned from HW
+ * @state: state of a pin
+ * @prop: pin properties
+ * @freq: current frequency of a pin
+ */
+struct ice_dpll_pin {
+	struct dpll_pin *pin;
+	struct ice_pf *pf;
+	u8 idx;
+	u8 num_parents;
+	u8 parent_idx[ICE_DPLL_RCLK_NUM_MAX];
+	u8 flags[ICE_DPLL_RCLK_NUM_MAX];
+	u8 state[ICE_DPLL_RCLK_NUM_MAX];
+	struct dpll_pin_properties prop;
+	u32 freq;
+};
+
+/** ice_dpll - store info required for DPLL control
+ * @dpll: pointer to dpll dev
+ * @pf: pointer to pf, which has registered the dpll_device
+ * @dpll_idx: index of dpll on the NIC
+ * @input_idx: currently selected input index
+ * @prev_input_idx: previously selected input index
+ * @ref_state: state of dpll reference signals
+ * @eec_mode: eec_mode dpll is configured for
+ * @phase_shift: phase shift delay of a dpll
+ * @input_prio: priorities of each input
+ * @dpll_state: current dpll sync state
+ * @prev_dpll_state: last dpll sync state
+ * @active_input: pointer to active input pin
+ * @prev_input: pointer to previous active input pin
+ */
+struct ice_dpll {
+	struct dpll_device *dpll;
+	struct ice_pf *pf;
+	u8 dpll_idx;
+	u8 input_idx;
+	u8 prev_input_idx;
+	u8 ref_state;
+	u8 eec_mode;
+	s64 phase_shift;
+	u8 *input_prio;
+	enum dpll_lock_status dpll_state;
+	enum dpll_lock_status prev_dpll_state;
+	enum dpll_mode mode;
+	struct dpll_pin *active_input;
+	struct dpll_pin *prev_input;
+};
+
+/** ice_dplls - store info required for CCU (clock controlling unit)
+ * @kworker: periodic worker
+ * @work: periodic work
+ * @lock: locks access to configuration of a dpll
+ * @eec: pointer to EEC dpll dev
+ * @pps: pointer to PPS dpll dev
+ * @inputs: input pins pointer
+ * @outputs: output pins pointer
+ * @rclk: recovered pins pointer
+ * @num_inputs: number of input pins available on dpll
+ * @num_outputs: number of output pins available on dpll
+ * @cgu_state_acq_err_num: number of errors returned during periodic work
+ * @base_rclk_idx: idx of first pin used for clock revocery pins
+ * @clock_id: clock_id of dplls
+ */
+struct ice_dplls {
+	struct kthread_worker *kworker;
+	struct kthread_delayed_work work;
+	struct mutex lock;
+	struct ice_dpll eec;
+	struct ice_dpll pps;
+	struct ice_dpll_pin *inputs;
+	struct ice_dpll_pin *outputs;
+	struct ice_dpll_pin rclk;
+	u8 num_inputs;
+	u8 num_outputs;
+	int cgu_state_acq_err_num;
+	u8 base_rclk_idx;
+	u64 clock_id;
+	s32 input_phase_adj_max;
+	s32 output_phase_adj_max;
+};
+
+void ice_dpll_init(struct ice_pf *pf);
+
+void ice_dpll_deinit(struct ice_pf *pf);
+
+#endif
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index c8286adae946..b73d3b1e48d1 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -4665,6 +4665,10 @@ static void ice_init_features(struct ice_pf *pf)
 	if (ice_is_feature_supported(pf, ICE_F_GNSS))
 		ice_gnss_init(pf);
 
+	if (ice_is_feature_supported(pf, ICE_F_CGU) ||
+	    ice_is_feature_supported(pf, ICE_F_PHY_RCLK))
+		ice_dpll_init(pf);
+
 	/* Note: Flow director init failure is non-fatal to load */
 	if (ice_init_fdir(pf))
 		dev_err(dev, "could not initialize flow director\n");
@@ -4691,6 +4695,8 @@ static void ice_deinit_features(struct ice_pf *pf)
 		ice_gnss_exit(pf);
 	if (test_bit(ICE_FLAG_PTP_SUPPORTED, pf->flags))
 		ice_ptp_release(pf);
+	if (test_bit(ICE_FLAG_DPLL, pf->flags))
+		ice_dpll_deinit(pf);
 }
 
 static void ice_init_wakeup(struct ice_pf *pf)
-- 
2.27.0


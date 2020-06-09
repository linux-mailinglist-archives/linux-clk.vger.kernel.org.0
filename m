Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630641F32A0
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jun 2020 05:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgFIDlO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Jun 2020 23:41:14 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:63253 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726917AbgFIDlN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Jun 2020 23:41:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591674073; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=+H9IspFF+BzeR3q7gfORtLhR8r07klEPuy1KgUWK1MA=; b=MUK+EKQJX/1FD4s/lUhNbmNp3LOsIwFlrVXn8IlG1zTo+zc73PFJyXL1wW6+UJp7gGE/9u/U
 OZLJaC49IdI7S4W7ka0h8XlOZpw0KX7PqWq9V+IyBqGPsTrJa2oCgpL7G74S12p12jBAm/va
 xjusUz6+y8eLoRbmCmKmWZ5D23s=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5edf04c7f9a7071345ede173 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 03:40:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5876CC433C6; Tue,  9 Jun 2020 03:40:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from tanmshah-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73CA1C433CA;
        Tue,  9 Jun 2020 03:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73CA1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     swboyd@chromium.org, sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v6 2/5] drm: add constant N value in helper file
Date:   Mon,  8 Jun 2020 20:40:47 -0700
Message-Id: <20200609034047.9407-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chandan Uddaraju <chandanu@codeaurora.org>

The constant N value (0x8000) is used by i915 DP
driver. Define this value in dp helper header file
to use in multiple Display Port drivers. Change
i915 driver accordingly.

Change in v6: Change commit message

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 include/drm/drm_dp_helper.h                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9ea1a39..4b2cfff 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8085,7 +8085,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
 	 * which the devices expect also in synchronous clock mode.
 	 */
 	if (constant_n)
-		*ret_n = 0x8000;
+		*ret_n = DP_LINK_CONSTANT_N_VALUE;
 	else
 		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2035ac4..589132a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1134,6 +1134,7 @@
 #define DP_MST_PHYSICAL_PORT_0 0
 #define DP_MST_LOGICAL_PORT_0 8
 
+#define DP_LINK_CONSTANT_N_VALUE 0x8000
 #define DP_LINK_STATUS_SIZE	   6
 bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


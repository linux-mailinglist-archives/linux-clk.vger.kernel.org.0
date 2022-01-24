Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26B74984B3
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jan 2022 17:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241103AbiAXQZa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Jan 2022 11:25:30 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:15842 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243717AbiAXQZ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 11:25:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1643041528; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=eGubF93/8A2pSVEbBCCvbinoPb+5WYeOv0o+QrJ6Xaw=; b=nYS7rbK+FlBof47q+Fcm1RPNvkyMjSu/kNZNnSigmy2cjOb8iIEvN2qov6rHmE4ClGxt2Tb/
 +vhSBtDPh0PG+pdMMI04a/lY0dKyMoMB27jsPCejQ9AAItz3nSy7nwsshWW8sPpOaugzo6+K
 MKf67+vKyh/nHcTYbERxVrY3puA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61eed2d7e0071250cfad0f11 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 Jan 2022 16:24:55
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3799C43619; Mon, 24 Jan 2022 16:24:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7617CC4338F;
        Mon, 24 Jan 2022 16:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7617CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/2] Add support for LPASS Core and Audio Clock for SC7280
Date:   Mon, 24 Jan 2022 21:54:40 +0530
Message-Id: <20220124162442.29497-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[v3]
 * Fix 'pm_clk_suspend' expansion warning in lpass_audio_cc_sc7280_probe
   and lpass_aon_cc_sc7280_probe.
 * Update the vco table frequencies.
 * Update 'regmap_config' name for all clock controllers.
 * Fix the missing 'const' for clk_init_data.
 * Update the binding for 'lpass_aon' CC.

[v2]
 * Drop code for "Add support for clock voting from GDSC" from
   drivers/clk/qcom/gdsc.c
 * Add support for runtime PM get/put from clk_summary.
 * Update commit message for PLL detect lock timeout increase.
 * Fix documentation bindings errors reported by DT_CHECKER_FLAGS.
 * Update the driver code to take care of the following
    - KCONFIG to add "select QCOM_GDSC"
    - Use of "const" for pll_vco and clk_init_data
    - Use of index instead of fw_name.
    - Fix extra space, remove 'lpass_create_pm_clks' and corresponding code.
    - cleanup 'lpass_hm_core_probe' and 'lpass_hm_sc7280_match_table'.

[v1]
This patchset supports the following.
- Few PLLs might require to a higher time to detect lock, thus increase the
  polling time.
- GDSC which require clocks to be explicitly enabled before access.
- LPASS core and audio clock driver support for SC7280.


Taniya Das (2):
  dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
  clk: qcom: lpass: Add support for LPASS clock controller for SC7280

 .../clock/qcom,sc7280-lpasscorecc.yaml        | 172 ++++
 drivers/clk/qcom/Kconfig                      |  10 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpassaudiocc-sc7280.c        | 837 ++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sc7280.c         | 430 +++++++++
 .../clock/qcom,lpassaudiocc-sc7280.h          |  43 +
 .../clock/qcom,lpasscorecc-sc7280.h           |  26 +
 7 files changed, 1519 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
 create mode 100644 drivers/clk/qcom/lpassaudiocc-sc7280.c
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7280.c
 create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.


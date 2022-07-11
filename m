Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888CF5689D9
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 15:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbiGFNmh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbiGFNmP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 09:42:15 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98225252AB;
        Wed,  6 Jul 2022 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PC6G8cw2IAjtxswfCppuN5Gom/ioWuRR2SaS/QD40Vs=; b=fwU1sVHabFrEgfedhrwyPqvE9V
        goamlr//PyZDEHhAjDPW5yyriwqekOVvEYdh+LlBSc/DB/3tqyD28vUvUIb8XQKhiwiPYZXSXmYML
        zMO3UTdrnmKja/NBAonIxVV+Z2hHvCyGuP9czsuFAYJSyboy2MqopkbttNpshb5vgbNazLWFxXruI
        n4DLgjKeN8dicdyy7PWqX69MBBXsw1IDmTfiBHBe6Pnx1jFh0yQSFzX5J+sTlRhbJBnAhQrUMpbQ/
        uHve3X4Wdkq8V1uBkEU6BPpiv+IIq7lecbvY3MqyEGspHxhePTFfpZD12t8/fBgHmvxlrWyJW2CSx
        lVF5HjrA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o95I6-007M5K-Ue; Wed, 06 Jul 2022 15:42:06 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 4/6] clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
Date:   Wed,  6 Jul 2022 15:41:30 +0200
Message-Id: <20220706134132.3623415-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The USB PHY on MSM8909 works with the driver used on MSM8916
(phy-qcom-usb-hs.c). When turning the PHY on/off it is first reset
using the standard reset controller API. On MSM8916 the reset is
provided by the USB driver (ci_hdrc_msm_por_reset() in ci_hdrc_msm.c).

While this seems to work on MSM8909 as well, the Qualcomm Linux sources
suggest that the PHY should be reset using the GCC_USB2_HS_PHY_ONLY_BCR
register instead. In general this is easy to set up in the device tree,
thanks to the standard reset controller API.

However, to conform to the specifications of the PHY the reset signal
should be asserted for at least 10 us. This is handled correctly on
MSM8916 in ci_hdrc_msm_por_reset(), but not within the GCC driver.

Fix this by making use of the new "udelay" field of qcom_reset_map
and set a delay of ~15 us between the assertion/deassertion of the
USB PHY reset signal.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Changes in v2: None.
---
 drivers/clk/qcom/gcc-msm8909.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8909.c b/drivers/clk/qcom/gcc-msm8909.c
index c551953d3791..2a00b11ce2cd 100644
--- a/drivers/clk/qcom/gcc-msm8909.c
+++ b/drivers/clk/qcom/gcc-msm8909.c
@@ -2670,7 +2670,7 @@ static const struct qcom_reset_map gcc_msm8909_resets[] = {
 	[GCC_SDCC2_BCR] = { 0x43000 },
 	[GCC_ULT_AUDIO_BCR] = { 0x1c0b4 },
 	[GCC_USB2A_PHY_BCR] = { 0x41028 },
-	[GCC_USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[GCC_USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[GCC_USB_HS_BCR] = { 0x41000 },
 	[GCC_VENUS0_BCR] = { 0x4c014 },
 	/* Subsystem Restart */
-- 
2.30.2


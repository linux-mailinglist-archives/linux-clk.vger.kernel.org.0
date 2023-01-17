Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27684670BFA
	for <lists+linux-clk@lfdr.de>; Tue, 17 Jan 2023 23:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjAQWqB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Jan 2023 17:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjAQWnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 17:43:32 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F8A676D7
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:21 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id mg12so6574144ejc.5
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60yxEW22hoAOOhOWGOTH5M2hZiABdMD97947KesUJto=;
        b=LwMWS+VvZVE3ldXkhlFA4EaXFH8AblN2KRcYiAQP6o7of1u4dcCgb1dJP/rpth5t4k
         Y2IKKB9CIj6xVahlZZVQRDwnoe799ut4gnmptapV2yjLf9nqZE3+bM+JVITcyGE8RUx9
         PqKz0Ew1R1Ro5BgRDODZvcJhESueuzOCt6ScW22dAAUK41oGvh+z8ehqv7FXQKUH5chy
         /KAxV60irRCRx4xAyP7eLp7pHVO6ejLc82KYB6c9i4i4bJdTXhA/L6JW0nfxGc2v7gQB
         feHpE3i1Jw6SyPKMo5PQskzRr+9CP6ykf31ReA0enPDSNgkWMTQng2u5/3BS7rUG+9mv
         5Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60yxEW22hoAOOhOWGOTH5M2hZiABdMD97947KesUJto=;
        b=IRzgCwUBtiORqvoqvMqJ8GFiaVLBPX0l8DcY2GP8LmYTstbZa2+GPVvEnTQK+aykEh
         vQZQAqtxLKPKIebB/2elr5BYYX7lxKJf9/nxAKt+bpOTxeR/eZBSeofznQLq0Ebn/Pol
         T2A6XW4FTP9F9YCg/aNfqeH3mXyrEx1dozdI7B7ieYQslSqy8dP+t2oX+e6eyaZLy89R
         7AwvkdCpTVnHqjZ0Pp8pP/949VZtP7J8gyPZ8jJwBR/nj2PwCLBfiYbEB+XRFtdvlii6
         TJijui6ePGXc1Eml/jBQKlkygbp3z0A/qbkrdn7fGFbqLAt1Q0dlmxKNwdU8e6HuhY3y
         OhXA==
X-Gm-Message-State: AFqh2kozP/bMuBGic+wQ51Zem8r8NVenJA8nE6sTghuHWpFzCMLGaFX4
        xh8ec+/ByZkHQ4otMs+79/63/g==
X-Google-Smtp-Source: AMrXdXtjLoM3h1yIIOScwTckOqNzXWURKc4/sjRj8UvHCQsCg/p9ym++eVy5WH4cGIlE66qHNG9S4w==
X-Received: by 2002:a17:907:a092:b0:85a:4230:756c with SMTP id hu18-20020a170907a09200b0085a4230756cmr4816939ejc.59.1673994620146;
        Tue, 17 Jan 2023 14:30:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
Date:   Wed, 18 Jan 2023 00:30:12 +0200
Message-Id: <20230117223013.1545026-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 also has the clock-related part of the APCS mailbox device.
Follow the usual pattern and create a child device to handle these
clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 0e9f9cba8668..bd61dacb44ba 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -42,7 +42,7 @@ static const struct qcom_apcs_ipc_data msm8994_apcs_data = {
 };
 
 static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
-	.offset = 16, .clk_name = NULL
+	.offset = 16, .clk_name = "qcom-apcs-msm8996-clk"
 };
 
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
-- 
2.39.0


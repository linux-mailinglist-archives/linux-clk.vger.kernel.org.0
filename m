Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C52D696FE6
	for <lists+linux-clk@lfdr.de>; Wed, 21 Aug 2019 04:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfHUC5b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Aug 2019 22:57:31 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37784 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbfHUC5b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 22:57:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id bj8so497226plb.4
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2019 19:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kTpWa1DIkfpJvRELBVr27cwiqR/tR9AaU9awO2MhQyc=;
        b=Bx/FYls7hvU12xUnK9D44oXA2TbC9SSL5DdUH6Iw1+OJSmnQVYyvJljQg+8PNXLbH9
         HZP4dGbtSMUmcWbHaa7MaUu4w3TLvcZW5rFCnls4nLhAFJslZDEUiGT+wIRnKkDDDaYg
         pau0XSRlGkX2YztDlmWlhjiNy0ccBy0rG3n21M4wJDxqws9Xmw98NixJtW8l7moGGnzb
         xEd9GuUTCrBIe5qhtlNcwYt60jMECW3EPtonYnYNpwVR0LV4EQCMMRNSg09oBjwJh2/V
         NwiSuaDf6Ky7D6UcFh8bU4v1kiz/beSPRzNAVXvrGlBe2ZkWty0/H/s9ES9hC8Q07cKY
         2V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kTpWa1DIkfpJvRELBVr27cwiqR/tR9AaU9awO2MhQyc=;
        b=WJ2rjYcXgWghal1Cx/sDO97C2XmzOVlEYKc6IiSGN2dyVutD4RHSHFoJG2G5OtK7TL
         wVMEiRxHeaTTSX8/SmS9yw8xOTrBhxqfnDuKesJlNCrkris+CLFpz9BDZzjjRO24IL75
         hrrKbBGMKLn07J6hwtyhgFlC1p+vx/9c4g11mgeCIpp1jW7BEb65yKy4tdNZJO+MlWGI
         97ltSRD4Ig/u1mw6o9hVNyvey91/R8WUAlk8cndEEVPfn1dQM/V0x0IGoHzM2sABk5Ov
         KDDGPDJIGzXmQrHdsynKC0NJzTO2jId/3GR1CIIFIiBLLggQEWM/ANoMxjFO8IyRp5Xb
         v6xA==
X-Gm-Message-State: APjAAAX4EEUcHlSkd3i9Jqsn/b8QvjdYHD/lLOAN+b0DoO3acCFPvLRm
        BYz58+fXy+414OI1hewpcPWD
X-Google-Smtp-Source: APXvYqzCYAHgUzWM5dAbKNZL5kxfN/EKhDekTXkWvc05Dn2pTYNnf9p4ZucvDiRW7wRjry35NYiMew==
X-Received: by 2002:a17:902:e30f:: with SMTP id cg15mr31950918plb.46.1566356250180;
        Tue, 20 Aug 2019 19:57:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7101:175:ddd7:6c31:ebc7:37e8])
        by smtp.gmail.com with ESMTPSA id d16sm13251682pfd.81.2019.08.20.19.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 19:57:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 6/7] MAINTAINERS: Add entry for Actions Semi SD/MMC driver and binding
Date:   Wed, 21 Aug 2019 08:26:28 +0530
Message-Id: <20190821025629.15470-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821025629.15470-1-manivannan.sadhasivam@linaro.org>
References: <20190821025629.15470-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MAINTAINERS entry for Actions Semi SD/MMC driver with its binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c31e6492b601..d13138330b97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1375,6 +1375,7 @@ F:	drivers/clk/actions/
 F:	drivers/clocksource/timer-owl*
 F:	drivers/dma/owl-dma.c
 F:	drivers/i2c/busses/i2c-owl.c
+F:	drivers/mmc/host/owl-mmc.c
 F:	drivers/pinctrl/actions/*
 F:	drivers/soc/actions/
 F:	include/dt-bindings/power/owl-*
@@ -1383,6 +1384,7 @@ F:	Documentation/devicetree/bindings/arm/actions.yaml
 F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 F:	Documentation/devicetree/bindings/dma/owl-dma.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
+F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
-- 
2.17.1


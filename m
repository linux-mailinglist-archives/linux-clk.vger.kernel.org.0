Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B432B3E07
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2019 17:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389534AbfIPPq5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Sep 2019 11:46:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40729 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389524AbfIPPq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 11:46:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so130220pfb.7
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 08:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YPh4ZPworY3ZEjE24wMYeyXg9KZRbq3tqWyWWQ8XlQ=;
        b=BfWwhPEGMjqhNnMmtn0lC4DzNN1IjQpfnqP/T++6lj+rV9L/5Bg0t/1kgQ5MOGeFAx
         xvUy28z95tNCGC9WQKuJJ5uoldqdK9xtCEx8RAzKXN6zirGepppIDIEHtIXHtmmmxffj
         ZIsLh5V4yQwFT9p5F3gIArlVndMNXi9LzjZucd23CMQ1n40vSGuqSb2eyvhzxq2bJMU+
         SdghuOWAi+Hcr2wqG0wBhIOSLvQ7Bd3zqaMcChDhPfJaJpTE5aSUcE/UjeMG5OhRs13D
         re7vcxUA/3C1ix8b6r8uh4RU3u3NCuHy6+jhrk3EW0f/3MDp1OpREjGICKmrz0IAEjHt
         4c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YPh4ZPworY3ZEjE24wMYeyXg9KZRbq3tqWyWWQ8XlQ=;
        b=dnSWOPM1Bngm+fprz1Xa7c+z7ckYkLsCOFkT5XEry4R1QcZ4wgbDlffAxDGUQf4yen
         haYU2FVzxdyL6T2h8YTCQ4zkGggJSzauuwwRtR9keKtYROgDTvjAxggirp+HW+QaKfFE
         8gHDaQLsjRjuKbyqKP7i3/r2nLYcdg8XuPzRsnVfSWXkoDgN0oyl4UhzSPrPteC9V1CK
         +jy1M6P5GPqP+VrVu8l3+8T+3kCe80N+cR4uPxIYqd5XDEmguCJkGr3893eDv1Qkz1Zc
         ViTDUWdCmuHLpSnXIrpupEjQReqR9wJM5SDW+u4bTdoGEKEdWHRuQSUoANjkoTC3WoBS
         o5rQ==
X-Gm-Message-State: APjAAAV6Ew04EllU5sjcdBtDSbo2jIcm0RTl4sC+xUiGf3D2ZxdBT/B4
        ef5590uWMLL5qFPy9bqyiAMS
X-Google-Smtp-Source: APXvYqyYx2ww8kVi2qoPwBEokJosm1TyyK6KqDfDlsvQfRrorAIUQCpG72R/TxSYvntUByBP1MkqIg==
X-Received: by 2002:a62:1e82:: with SMTP id e124mr16568271pfe.136.1568648815572;
        Mon, 16 Sep 2019 08:46:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id s5sm36227670pfe.52.2019.09.16.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:46:55 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 7/7] arm64: configs: Enable Actions Semi platform in defconfig
Date:   Mon, 16 Sep 2019 21:15:46 +0530
Message-Id: <20190916154546.24982-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the Actions Semi platform can now boot a distro, enable it in
ARM64 defconfig.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e58ef02880c..8e27777d6687 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
-- 
2.17.1


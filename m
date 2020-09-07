Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F7125F6AD
	for <lists+linux-clk@lfdr.de>; Mon,  7 Sep 2020 11:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgIGJit (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Sep 2020 05:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgIGJiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Sep 2020 05:38:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29377C0613ED
        for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2020 02:38:17 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so13689723wmh.4
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2020 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
        b=x5OvvQUkQ4I2LoNSkzzhx7+W8bsO/ZK+grYryhcNhh2GnuOJrKUI34PxB9IXwKoDn+
         LqVt4VbSrgEe98AjCzT96WwDVHuu0/mNSVlEya8GiGHMHcSG+2AMkpA386+kpcihAp4u
         EX+sgczSwYvRJhXtSGmezYLMwX7W28/HD6mPBUfhr+KuYnXst8uMh0zIx2c7jWDHkYFo
         0M9SjCWO6dLVIZLuqNRTK5x//eBcgk9dpQJiF+yktcvQULZ6OVLkRCVrXTyioRktnzTK
         AGeTw11CRE0Val89BCKJ8+vuSyEzVlOaaFy5v2F/6TKcVsf91yhH26LyDBO6iXYsqa37
         8Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
        b=ZzcZa33EnWlmuv5KwagUwx4Xsh3J/s7as+25z5BVRa+UPZnWmtInbUPIMGPe7wfiyt
         1IGL7/+155p3NfLG9XDY1iJGRrw0xDHH7wZyQiISeNWod69rgF9DPZgMImI1SGoBaoqT
         vTj5Vbn+R5M5nokRnsxpz12ILVZWu3K0azmL7bVcOAfPKDHygGokndj6rvK04m0X0kor
         x5sZXv/4VaZhZ5goKarh7XjdhJSPBwfs2K4wqTacg0nyku4V2VT6v8aF++3Ts62V8sbx
         yLCHH3zVh7fickEjxd4hUqQXmxEQDSUpnnRe/wzL+RH8C1/WShUX56VRUJ2hYhzRNhY+
         GqrA==
X-Gm-Message-State: AOAM530BIJP56TcQR51PYCEjMG09yeKwHXjqp0JpOHfV1zSkZ8CqRK7z
        uGesfCT/zvGK6QFd2dhMPairzQ==
X-Google-Smtp-Source: ABdhPJy6RXmzUtHiqGSQ+Zn7a1yFtQEiNWhWQFBWPvR3QOL3F52xazfR89nrTNoJVR99ebtMkMS+bA==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr21016967wme.128.1599471496274;
        Mon, 07 Sep 2020 02:38:16 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
        by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 02:38:15 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/4] dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
Date:   Mon,  7 Sep 2020 11:38:08 +0200
Message-Id: <20200907093810.6585-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907093810.6585-1-narmstrong@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock ID for the MIPI DSI Host clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 281df3e0f131..e2749dbc74b8 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -96,5 +96,6 @@
 #define CLKID_VCLK2_DIV6			130
 #define CLKID_VCLK2_DIV12			131
 #define CLKID_CTS_ENCL				133
+#define CLKID_VDIN_MEAS				136
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0


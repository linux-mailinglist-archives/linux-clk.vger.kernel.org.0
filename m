Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886375651D
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jun 2019 11:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfFZJGu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jun 2019 05:06:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43488 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfFZJGt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so1753318wru.10
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=iGiWLvlF9SZhluA3F+KAM2/tCHwVb25WwE0mD4s7gqR2aS8FzItv4qoTJ8Iao5iq48
         JaGcJ1DCcq6Q5eL1kVo0OYiG0qZGnLj3xOZOmOW6559WsqekGnFnpodwwgfq7cvmeO5G
         ycFBGVOMHZCGZCe7wrm9mJgOtzcTwg7RneAEhQ1Z6oFfDyPL0bNHHTYbYOxgcukStIua
         7DXFslAO7UTuzF7RjMKOalwvB9PjrMAWzM9dCIfNr12ASjR7BRvyQl5nXcdOMoy5i9xH
         /BgNivTRdSxu4JrnIBNLYf/tg5kZF415nAXXk5+id6Km+clLGLeqUId6zbOyhS+En46P
         yvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=DrNnEby9aAypMcVb80nCvHadYcGpNSx14X65xD6a4O4JDy98wAKRDhVuilFaMdM6MW
         9Qg00EiRS+R2IhN1Ge5k+mZpm0rTxtZ939Duoq8vxPTINSVgXt+DDBpdbmmO2IjcOyG7
         LMFhOwuYghQ4nR7k4MNlMLh+GzHCKulvgbjDZCEOi60psVnUoXQCG4aYArvWvqPjc4Ye
         S5PlKxqKly8DXqT9asBq+R5bvqbWdUN73tDIWU79Lu3SuezmSGM6d8+/7vyxnYMrtgnv
         M+aFP2QBUVX7inREJN7rq5HLx375Gu+UJQh0oXKHilMzC6E13uvMzIC/P/i2PvEE4xdL
         wSTw==
X-Gm-Message-State: APjAAAWAL82eO18sFtQuq4xTALrdvFg+oifIMwW08tBXGfAndtA60a+X
        JDSl9SB6XtJ8baXjJkB+diPMTg==
X-Google-Smtp-Source: APXvYqxGIbGVdH3JbhRFGsnQlF9QaGYIVNAf55TKRRbU5nT1JyjtgKrrXt4UH6i4OZuMmo0ITXSpgw==
X-Received: by 2002:adf:81c9:: with SMTP id 67mr2686925wra.62.1561540007306;
        Wed, 26 Jun 2019 02:06:47 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:46 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 10/14] arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
Date:   Wed, 26 Jun 2019 11:06:28 +0200
Message-Id: <20190626090632.7540-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 2baa04303762..76484801478d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1984,6 +1984,14 @@
 						};
 					};
 
+					pwm_a_e_pins: pwm-a-e {
+						mux {
+							groups = "pwm_a_e";
+							function = "pwm_a_e";
+							bias-disable;
+						};
+					};
+
 					pwm_ao_a_pins: pwm-ao-a {
 						mux {
 							groups = "pwm_ao_a";
-- 
2.21.0


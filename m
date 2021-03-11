Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2E933773B
	for <lists+linux-clk@lfdr.de>; Thu, 11 Mar 2021 16:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhCKP02 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Mar 2021 10:26:28 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33903 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhCKP0A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 10:26:00 -0500
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKNCI-0004rp-6Y
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 15:25:58 +0000
Received: by mail-ed1-f72.google.com with SMTP id h5so10066647edf.17
        for <linux-clk@vger.kernel.org>; Thu, 11 Mar 2021 07:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xs6GGjw8nQu2H0zJNhMFfPjtjv4pASlZetLF+qPJ3jI=;
        b=To0hO/YfiSiitq47O3d+hB7tY2YWxH6WtxnRIAPigta4ft74NxWFed7eH8hTBkaxGH
         WNWc7nbYAb+efQFkZrMsLVrZL/hA1avgUMWGu3RCFP7GA+QJee0XjaVRR+AfSrY9nVhZ
         9qixM+pUQpOY9hWrQeKNztjiYu8n7W8+AgvyrArT1RVk4U4VJSNHrsUtt04oyTRFu+kx
         V6L2YJ/MqqjpNyoBG4zIzvGD2pU5lLarfJOHkZxx7EQTYiuRoWw3WBGofyAY+8IYZmnY
         xfCkTixQqi15FWI7u0BSfUbuTqEdVr2lUlRYrZvmUZyytm8qtTWCGJ3wsu05yQSHbOIR
         olrg==
X-Gm-Message-State: AOAM530mHhETLN1ZcPpp4GITspD4tYZzntsaay8AGDu/DogYKtiBWIEe
        e7z8z/AOZ9Q04eOYc/XIZD3bmo8N81/3OOgp2ldpEUgjGznR+MWvlCG4toWyNpbVNwuuGvKzyy6
        HdCZ5up43WyEBapVKa3QggV+M+7bYavDmZ5FYcw==
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr9025971edb.133.1615476357796;
        Thu, 11 Mar 2021 07:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEy/VWcYtVhHpWmtyv1K3JAU4Nmfhx02KoGEuoEu8P/ERdDmK4z05THjQn7v4EX/URDdO6zA==
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr9025945edb.133.1615476357547;
        Thu, 11 Mar 2021 07:25:57 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:25:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date:   Thu, 11 Mar 2021 16:25:36 +0100
Message-Id: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 12e46b12e587..1e29e5ad107a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,10 +104,9 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
+obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
 obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
 obj-$(CONFIG_ARCH_N5X)			+= socfpga/
-obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-- 
2.25.1


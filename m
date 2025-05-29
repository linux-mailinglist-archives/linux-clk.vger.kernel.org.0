Return-Path: <linux-clk+bounces-22415-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF9AC7C27
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 12:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02411C04519
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B015A28FA80;
	Thu, 29 May 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LBJ2Zn3w"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3B28ECD7
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515695; cv=none; b=EKpQSearnFCsUoIyX6E5Moe5MYhsT2Pyh6eP652fcvgFjc/vX3PjBbOhXtuXrJhUXByBVq2aRevNvjIetn2EAfZTlJBwbZw016cWX3vBxxRcQqSD1W3w0VbFKvergKU6O36esOGwz1IdvTRqFGrHAwIrtjlSMAj0sTH1XRntwRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515695; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAX8xxYDeSjQ4o988v5QUlbcGmdHDnxrYbvjLGTS/eH9otefRcCYQFCzmO6WNKYiE0VFnEsUWYtzxBAGr/bM6hFWo52HX1RuPNK43377jE0q39VJWrdpwkibD2XqX3cuKpMAlJfDdRM0DrhmmmaOieIUzv+P2TQ/OLx9imeZTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LBJ2Zn3w; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad572ba1347so112820866b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515690; x=1749120490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=LBJ2Zn3wfuElg61hcinZcwDrGkFTxKVEDrpHD7NuT7LPJPTL6tXZMPcuSZ+7eS1dNQ
         0EsAiEBEzj6poeJ/fdLnyS68fR6kydz1f5KL6KK8Okp2T3MmLA5kWhZRTUPe9npUvf/e
         05ZdNIMrmQMtw6PusbulacDbZ8L/Imqdg+QUSAHxqE3O8Kq+BXIW1F34yM54ndjHI4wj
         b49A2Nt6txEnhmITga8MtpymdsihkizpU6a/AP96v+S32kAItRIr+rw+dXWPNt135Da3
         SMjRhwp9YBGwHnx+AXZBl/TJlAKJT6kWC2IEtQHrMlznA7f54nIUrPUHTSdvWix/VL51
         SYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515690; x=1749120490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=RkaU05Jo/O2855wiHr2XuyxU2oEq3wGXUT4CbN6T/6g8TrjrtIOhB1gSNKxGvfgNoz
         +mxyGtEb9KCDV0ETAerKqDaZmkUSsccF/MHvj/JGQwi0OijdQnPl8f/tt27rswqzGNRS
         XSLMCLv2dHLhRl79rEdcS+9DNwwvPPctDV4uCEf9l4mgJ1QD/QlaN87blJUP0ewNQC2M
         riQ5AmHI1SQz7SablkKohnUozFYjzrDZ2wmPlmkIOdDGf9QOf7gjYDYZxf2yXmuWLJhu
         +RAqrImXakfzeWSIpESUkuz6NWwh+I21WHRJjsZ2RGdSl5wdGUFxT6j2SNRx/LgJO///
         fFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs1OnXpb/QMFJVyI9S7ZkPWRJoKijcKhSMLSuRuyQcSO8dLF+Fzv55kvGTeUXm2fSgUosI99aWBrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS0P4s3xS0Pm0BQrPVLSmybAxqnk7Oc4B378OAPOUbBAY6p75M
	cAZC8b3vO5FGQJEDEOqjXUAfnFuhnWp0ZDJpU3z5i3ZVA3xf2NOd5OpKYgQx/GKRqzg=
X-Gm-Gg: ASbGncsWN2CCXcn3mzZSBKlqxa+tPTpCjWRjEtwY6YPsF+C1JZ4y1LzJteXjCbrCVy3
	u8pL1GqVSUsw8NFmgo/EqZ0SJJ0mvf+e/zH48T9amdvzBSS9NHaKRpYDBClmcuJJe3jgIwy9AJf
	4ogP1aBpmhN1w6wo7990YipXiuXrAVswxYdQ8Mwxku6L9kAKsJuLW+zS9vqShP2N7XhYf9ji4Yz
	loyQC4l7GhKcFLmjNVn231b8K35EI+PierEbXfWxhb/mXTHLNvcd47bnWuMafuYIEojWpRHGf+k
	ebrgXqdM9037qDo7RRgwkLwouVojIBZU4d8Vs5mOvu7UY5C8ygJT0ECknVqlDxtDLo+Pn4VQ5MO
	bFZDDrnPBs5LsXkZD5EJiYg==
X-Google-Smtp-Source: AGHT+IEvqDlvsLAy+T6fI+vBgq2bdMThjlvuZRnUHLwEn3hRivUFxx6+EsUGWC1RvaIzLQHDhitSEA==
X-Received: by 2002:a17:907:7245:b0:ad8:9645:7965 with SMTP id a640c23a62f3a-ad8964582e8mr902544766b.42.1748515690473;
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e8780f5sm119453466b.95.2025.05.29.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 10/10] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 12:49:27 +0200
Message-ID: <20250529104940.23053-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3



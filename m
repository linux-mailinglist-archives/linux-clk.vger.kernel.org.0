Return-Path: <linux-clk+bounces-5997-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126308A7074
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 17:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 894FEB22098
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2B131BDE;
	Tue, 16 Apr 2024 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2mvFo1xG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585F137917
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282811; cv=none; b=LicEBv+xrSW3w8hQHUxKzIgnQkflSHgysRLX/2nCCL37Jzr2WwII2cJXHjub3PelwUdESOEJsaeKNvIVX5tjKskdli5uYCsouU4P4bV75AVf6ay6xC/kAo1AzfqX5NlqNXaavtRxXTZoCFQ5cZ17hy0rrF9cskrsgH2Dd8h6log=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282811; c=relaxed/simple;
	bh=71/hK7M+iGlW9MxCcEOGM/GxmC2HFwhgUk+pNO21FM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0XcrXNkuFDYU6Awbvn8AjFRwCVn8KOzEWhjwAwDzLcHpQ1wqV7ACj9d9WOzIZW6k8GHgAtTnXBJMKGpJDIzDNEdzLGiAQPqmueak7SnaNerBA9rzbupdQoqqM9kV3BGUNGDp3jiTJKPL6/rf8iYQr0jCdgGRkTQjf8eSZdg/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2mvFo1xG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57013379e17so3199456a12.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282807; x=1713887607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=2mvFo1xGt3X4ynokpML6GsOJUClY78xQqS3uakcnXNj3lOwWmfIOlC9hSYGDgszQR1
         65BfNU2oks0KKGXIhQBd5RHanjJErmOnBlz4qoMUZQzdoy3VkfBusT1cSBfsNZ2xgki4
         JCGvODgTGuPIugGmP+tHZzC55mH3uzqA4DnxaV3Z6GlOrpXcU6pCM1cYc6Zqk1S7Q6Hy
         LljCO5As5w0x1PRFu0Vkg9ZFFyJHIS//mwTQnPUUT/LFP+zhTeFD68Kf4LiT+yIUcWjn
         V8ErCudG0OkvABG1hPjsTJ8jQUpDaMrQXi23jIpaltimk8qw7HPBLrdDnu1L2WZ5rxAF
         U7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282807; x=1713887607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=mmsuVVK+UoxtcLDeLRbRd02V5aZqtDSeNyNh9Mmzj1vDqX0lNBvCysQKKA+PNliA5+
         lOCX78+tSNCZy/EjXkwCaufexaHciL2TAAXT98MOkYdn3lkJu+eWpG0UjT5pjPz2PTAS
         l2o6QTLQh8Vuul9ZyxP1Ff6wNV5EGj5KZ0aNaNc2TEU5QM4tdjoGgQU7tnaLTGExQTBS
         41quzbVo/mVkI6kQYd1CWSi2/zHRyBybB3ZNBh/bY3YX7Ac7bicsGODnyR0LXMfcq0P7
         z/0tPZr8VKOC9tDfJ+1QlKSmxZQqOK2TmheCX72nkl8o4pTGS4DteUuxwYbTzC6oCRYY
         hl9A==
X-Forwarded-Encrypted: i=1; AJvYcCVUUc4ZtZAaSMSV2KXT8kEMrACyQEws9vI90EGfZzEIuJCPiX4NENpjW5b7Ow1HZ6A8pqjyDHKdnKY4ulBeLtv1UM9rdiuDlL9P
X-Gm-Message-State: AOJu0YwuscGkXE8Tz0pXWbb4vI9Czsg9vLsmipdjJXuLyCjgu9uIawUE
	LudLrKP6As9abcUXKCZYSOQrLU7eJ0VnF/KkLG840pFBYJyc2QCKYlEYq5tr58o=
X-Google-Smtp-Source: AGHT+IHG4nMoaKSD57SAIyTlyvLPyxnK1HAvzHuj382xIJFY3e72ktmyLHdo6Y32nrQ9p7F9ZplNGA==
X-Received: by 2002:a17:907:36ca:b0:a52:551e:7502 with SMTP id bj10-20020a17090736ca00b00a52551e7502mr8380201ejc.9.1713282807516;
        Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 16 Apr 2024 17:53:07 +0200
Subject: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=P6NTpV6Hcl2nq4Xnripe5Czc4f+S/tebkAJSAKKZfY8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q7A3lCxlMP0/HKhvtUiqGnm0iuZfwyvQOOBOs
 O6ocHteJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURUboEA
 CszLi6XJJcSVfKekD6IFu8zgjjPhyOHS6yOkiwK1inBDCiL3iYY9FBJJODWPA45yDccHp+kS4CM1GI
 NidF35oVE8KzVxPLph5vvUjfTxPpWKMuZwCMiXrOxD4YCqgtruDi6/6+ksSklxTXykiDoXer95bh/Y
 8eMnvUYTqO56etpeuErbtPrUhT4J1A41d3l7pWDN40+/KUnp36d+I/RYO7BIdBHTTQrZ/eJ5Uew0/a
 A7MjRoAHfoL/OEmgEIdAmOsFJKqTR/ixYvBJc/dTN9XshT2UAozJ6LhB4kiJ4ztGMm3xmPyIWeXg8s
 quX+bzYiYIXQnJzLJPL4UG3Y8/TUKzTC3tVajNjQKMqB2464mzI+0hfvz3ENLxmn2/IjN/nTbnkAeG
 V2t4/XyTcFKp+pMx9GgBFYcReVm4R/jYTnSNeCbo+cYKyhWHBiWdsAKqisWBXrduxVPO3Kd5YKHdwQ
 Nan0eLZTWTPJ5EjqQvp1YEM9IiQ1nc06gGpDpZnUJPi+nBGb43mp7BXlRFovjqJi9eB3yqfnLTpucj
 k8/7+2ZXJYtCi5i8D8Uzq6FWSrUUsefx3izGPKRDfNNQUtHjFs+W+C6Nqk4aH7qJ4+GQTkC2z84xgM
 trLY+7vwAgVDrICwYMmqmo8xqFYYrarWAME8lE4m6l1YvqB+8T0sfoZEGCng==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1



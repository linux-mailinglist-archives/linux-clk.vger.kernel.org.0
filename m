Return-Path: <linux-clk+bounces-6123-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 783478A9C9F
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C74BCB21FED
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 14:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8F316C877;
	Thu, 18 Apr 2024 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bCNXAKyR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB23216C84C
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449839; cv=none; b=O7YRqix5shWTCTF4tQ9w/W7W7mNJSDt6NCiBn+Ot2gl/7sTCU65Qd23/2HG0HJA3eO0AQ6/3UroTXbXgs5zAFc1Dcqk7p3ADcnOcIJeqYbWOc5ol8dyAYGRKwOyzSpYQOhhwUnA1dYL8SiY0zeNN7IW8bgLFf4bZwEsF7NqZN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449839; c=relaxed/simple;
	bh=zzCIaD8rTG1/kp/ZSileQtlNEnXTYcjPAL1DZHwA70o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7HT3TExW+QhSCW4xD5v2md0xAe3FOHfCheddz/jzrtVxpZH3hqA9vc58N5Xmc5QllVw8ZXELLBgaQDQLukJJsWvTtg2R6u60v0dar0dU2ReRgFJ/PFVP6wJ2AQ5kxVJbOojnIc3UCweo+ploct9RpipgRMTXRMYbcXOFaGLKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bCNXAKyR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-418effbc70cso3842795e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449836; x=1714054636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
        b=bCNXAKyRycA8XabML1BimSpkDtB57zhUkKt+AaYAC1uXJh43hcPEZX6Drzgb4geGy4
         Fv/O3VyYM34++EX2eunixf1XMvJ9feSJaZhoa1924RH+BNe2rf3gPtoNypo2sP3SXBCu
         EUae+kj/Noshj0rsCtZER0Lbji/wBto0KAULAQuz18GCOd5TllYZjCUXcYFRNZgReRl/
         OlSPFd8f8JB33UF9J77WSPiGEHJEmPPn0AhchvcwbG3VRxuHJTBxV5pKf7YwzJVI0wT1
         eafHkrKYtDvyoPvTdriBVVdi3A92k4Y55LS0B4WPmYm9xBh25hpcTFSfBIHVo0LKgipH
         6a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449836; x=1714054636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
        b=vTYdsPgKXzcuQ1fLXuCBoCAFa7q+5xwLspLyLJA4gWML2+Hs3fHP3UeCHbod78NYLM
         PC67aAso50iu9IGx2asPSDdMIiZbDmifKZVSslJM+hlAN5XUye8yw/1JbK3WKkh78+sI
         uezzdmZVA1WMVZVwTdse/Uj7j2uGgvU8OZCiddvmcXDdC4dT3TbyBCzt+MvJzD7HI/mN
         X+J6uHX6s9DPy6Pt8WjeoDPoWsZ2mB89y27RYuM3SXxmq379xqitCMelTBoMMnpE6G35
         pBoFzgMfArC3KkwSyzBDDCDwXol/JUNIGZEAdWCY6Fqd4IMzgBXvpf6lszf0z8VrhJlu
         Dqbw==
X-Forwarded-Encrypted: i=1; AJvYcCXNt67YCrJZXJh7BNeu+weMxAFTWxP1QC5B4seo436v3LpcdMvBpRaIi97lxl4CevI79k4vGHPfgL99bRCjFzQrqfB2dNisHlyI
X-Gm-Message-State: AOJu0YwfRBJVZVo70lcdXF5tcqQ13ZVvw4XI3EGaMn6wy7ukY3O1TCi7
	GLFAOdK+uTfGf971qPHt5RgW4QuJzxdqdnjKMmvPwRKk8BZNiiXtEs5kE0l3VLQ=
X-Google-Smtp-Source: AGHT+IER62CdAE5/5oot4D2adTIVLRgUG/egF1vr5z7vePcV4RnBSZGtaXvV2hHCju1kll+OUBkpwA==
X-Received: by 2002:a05:600c:a12:b0:414:8abb:a96b with SMTP id z18-20020a05600c0a1200b004148abba96bmr2014596wmp.34.1713449836080;
        Thu, 18 Apr 2024 07:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:52 +0200
Subject: [PATCH v3 04/17] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-4-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zzCIaD8rTG1/kp/ZSileQtlNEnXTYcjPAL1DZHwA70o=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStitcbsX009PW5cbVFw1hXuGllJFI83TYn8zPhf
 rz/CcdeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURWNHEA
 CaKphXLr+uLHFI1nnefySVhPPO7is8O4I83eRLO4ymwrkeRxbJehmGXVQBbDqnwu5zjiP9BmmbP4R/
 Y0EVmGTML8JP7vH36fZ6AdfyOiZv6PLmpmQa/J0q2jhqpqnrFAZR0Qi+jt5XK+iKNEiqgToAOL8+LD
 pTwpgqfioGAjnRQAGLOIK6EvuAhrH/20NKL/PupWSb70Q/S6OyFX0Y6mGMOTeuHUXF1ergSHLcL1HF
 0XxUf2EH6vfCheLvExdzBlo5HvULGi4cSriAWBcQhKE5sgMIva7bMRF4QuyFcbcu5GUQVR6AlYb4/z
 l5YxaiDyxWKJVUM/Sg3yiI2fkS8HEF4B1KZDsmzo2j+vE5oXK1KwU2XzU9Yj7B/OWv3XIgFbbD8N+d
 xoV7Z8mhSCPE1zhfOPI4r4p0Vvi8LnuoadKK+rZd3fcmVYmX8hIA6RJ61z+cea1rgTkyd5qfty2yh0
 FR2z0DLsOJtyX3TKVXcFcU/vhq4YrS5cZvaIvACh35XH7UUWxMvaPJtPEZYXWiNtmUUuBu6QQIzHsB
 JPEKRk9/8aySxzP1IjYviwc7nuwqUCWDHug+A4+0KuffSSISRMUM6ReUhGazF7tbJIscFuZVWcI3Nl
 MdCF7okXP0MmThxayji4DOb68QmXDGLOLn1ONLwyZZVH2md/eHgFjvBLh6xA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1



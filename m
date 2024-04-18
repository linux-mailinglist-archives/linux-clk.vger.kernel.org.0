Return-Path: <linux-clk+bounces-6120-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83F8A9C94
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 16:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15011C2365D
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724F16C692;
	Thu, 18 Apr 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vKAucm63"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982C168AEC
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449835; cv=none; b=DZhCZ4iIwsVvNcCpBefzRayVgMxA8116SDMPnyubIe/h5b/xiJRxi4nGDx/509EXUkYy90yPzm2OX4v7pRRm01Q61Cntt+tir1bx1p2VGlzF3t5S2bhpd7ynFbAcLHQ6hKtWKifw/g+FBTQnCxgVPi561sIvbO51/iA1goT+DbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449835; c=relaxed/simple;
	bh=DLryLa8O7iEQrZUEVAGOL74G0qHULUzTiJ6209ggFjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBvLe5XC98z33SKIeuxUJ4URP6eKOa6alnHADrosMvkT8rXtpNN2Wo4zYDy9rSzAqRz62PxwCk7xvLUDhmlJWEzlIb0ErfAUL5/dI6vyvUTsiPKKpFuOTa3tYvizS6O6hj0cC6Nr0PSWMTDkQ3Vii+Uxnp1K8M2RGYCtwGQKnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vKAucm63; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-418effbc5d4so3218055e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449832; x=1714054632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
        b=vKAucm63l4/dZ6tRbfjJO/b1+a45yweJsJS/AeWAiYaz2CdVG23ecduPhiE2TlVYsV
         uDoS0MC/7JO8zL4DGJ4b2WnZY42i4h1B+XmhVYIWNMmfy8HyftH5BHK8UPa+zSc5XaI2
         /cgldMMJXaIQE02uxs45tiYxCjGm6lUyE1Kz9v77h/ba7Q2rW+eZL499NQtiJfKv+k/Q
         gdHlwi3vVx6zV7LEit6SLfdYsTumflalbX5tzkhystUQyz+fvWkkmcCPbbMC82/mUK4U
         jzY8aJGibwhfRY3t5tnyUxUyDcnFHAeJeanB+U8UB5HMm/I66mhffnRkYbj7KYEs1luD
         /0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449832; x=1714054632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
        b=kGdUNN2HaJVEf6EQM4Jsjjr/+wHZiDZObJyzdbbPiXaqH57NeHe10eG8sRQLw5DopV
         JVKUq+xEphsvxX7cLDZI8sFOrLLW81q8OwgMuLJZe0OiMdbRplLdQrhWmjAVuFmsMS+T
         pxVrOdj9CHFs7OHcDNf8B4/YOiQvagTI0MWQ+O7zftnNsiaITnq4H1xoqCPahg3mAvcT
         13S3IIC7QTQZohJiWfwXyra8F7Nubn83RHVTV3TW5ASdCOSIAaDx4Fq3o3IcK2+65lRN
         /djp3z8yPK60NwhniFXxiG8nrwFesvwbdRUngdSntDOodQuS1LICvV/kevcpCRKq/qeR
         GZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXJtNXhBCBDMJVHQZOl3YP0+/y+9VV7jxmEfJAVHm13+NgqVvtZzdmGLxI69BM2JZK9CbUzY8wUZJa2f2o3SX7kP8M/OeOMMiqy
X-Gm-Message-State: AOJu0Yyq568fJM+HQmM/ZyUBIBR3uFHcjP8An94M4ILyEoW+GPgoRXXl
	amynLQ0oeMRadQH//1OL/O1vLzawYkSusPa9nXcoE4fneiZ96awfCO+0Wag57eA=
X-Google-Smtp-Source: AGHT+IFTjzRpWK6iDi01DywjVdh8/v4t3z3199bOhoMDOHvDHlFawM4QhxRAJOfj2/Qsjae2GFxPbg==
X-Received: by 2002:a05:600c:4710:b0:418:829e:efa5 with SMTP id v16-20020a05600c471000b00418829eefa5mr2601682wmo.20.1713449832214;
        Thu, 18 Apr 2024 07:17:12 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:50 +0200
Subject: [PATCH v3 02/17] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-2-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DLryLa8O7iEQrZUEVAGOL74G0qHULUzTiJ6209ggFjg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmISti5dQRvICs+TNWn9PcvcaXjHRymsUXz5cyKmOy
 gTr2alGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTCbD/
 0RoSlJPIusbA/ANyTOZy03WTuf6qpmm/7E76EPyETfQy89dcQx89oVWZG7tbWvZYTCLLYQdqDSIbXJ
 EW0M94hkg3BbwPvN8d1Y35T+9XjOZj2cX8RkgQt1HJ6mN+j43iIUqY73ZQUMVY5t2xXNqYdA6vy5tG
 RwvuL8F81Qu0WbD9S4pKCHDdN+yvIvMmA5og2KAw9RKnQZWZvE0DXVkHurMOHgZFGXFwqOppvCLF+6
 c7DKgP5D5yLPrGTdHYTjfZf6AI8PacTvv1KcaGGeCW1zq6cSpv6AKfjiGETGhJxyIURzmQ8acFhHYk
 fMNj+AxQczDMNk4KL3Neuyu38RLeDKmi2pnevus7THXSeOuKWUxHFO9Ns8+gwjAb62vOhiNiDcxR30
 u22RhSdXqMhNRnPNX59D1r36QGMrOHsemN7CzpMXxtf0lmdYXIvhwD14NTSkIVDQWdV+Ko2ZcObJyd
 PjAcqW7cirsORw8QcQAb74RODyEjKrZnDN3DSaNitv++UgqdT+Ph8Jw/K+yYrCnmvS4fXIY5+aEmSZ
 AQqnjibLgU7WtuTuGSkjjThwWhmlprsOrYQvqGb+bpOna0y9QxbaXpPWgWw2JLgiRyC3Y25ayG40fL
 gUuyPpivBHlfmrEQ8mvpA6d1e1NypftXdVe5aqr5gJGUXm89nrXYGVNU4v9w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1



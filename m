Return-Path: <linux-clk+bounces-6131-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 146378A9CC2
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 16:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC28A287BF0
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 14:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1328A16F859;
	Thu, 18 Apr 2024 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iY7UUnCO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8916F824
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449855; cv=none; b=E7qv+sSpMs/CcIoXYuN7o8vhsVnTio0+zz+goAg+Lwq/6CM/tZGuL+LVAgA7paZyJYkyDggClMPE0e0m4n1THjJJ8iBiTeH0EiL//qF7XrSU2jzdD9O49BbPOOIQT5AzcP1g6dkr9UTwu09PBzzVoO3M8JWfsjn58kc3eK9LVA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449855; c=relaxed/simple;
	bh=CxkLUlifqvxz1G/Eho8b8T4Is6DgFjTZfGPXl6VYPH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbamQfR/gmNFaqDwjtYyypRFfXkopSAw7trOeh/PCjWZAmijLzrCss9FZkcj6S/4iNNtMzZDMzBkSDuhYMnQm1guaS3E48RIhulXEq/DhETMoT47dQ7TdvVCN7pPeoDLaYHXXnkv/h6fktpZ00rfgXDSUDvUKoCc/CdeQKuEdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iY7UUnCO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41551639550so6571045e9.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449849; x=1714054649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
        b=iY7UUnCOCDIfuaWkby8F4OSsYQlvwKhUME9P7I90NOrEdYT4W52xM1QGV9Ik7G/975
         1u7qM+qJy+fw8Ypa0FbfA2HniKV/bwLlbKrzG+vl11htogEzd7Geco3pkfTskR2WgEcw
         ej05Pnxw9AJCvlZGjbBMiKzFAjyx77Hb1cOA3OvN+neN6o3ZGufO5McrL3pKmeQsGh79
         qXXgPklJBUTD08xpmv1nWBfyU0ekr2xnUG9G2UdpAaIlu2uflacV8PriiybF8g6Se8IL
         zfcbv2QDCh2Ft2HY8SZ/wCY1irk5IKlgqGfnl6doqdDpK5tP1QojtfXqAhAc6yx+KwS1
         EYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449849; x=1714054649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
        b=dGq4AsZekLdfYCZlSstipvD62hsSQXcqE6mdejgjEBQIhoSuA5ZqSZcEndEQf+1uNR
         eaf2TcCRaDWJUvNT5ypfXLUTmzZP118EYEFlQyRgEIap/GnL7qbdepZnArPnnVf7ZRYb
         8+vE2/wIHyHIqbxNogCZQbyNFaZd3oMEJCdxlpJZzfGqr7aq2AfHCODtOCFIw5lPRMKF
         2Yafj5jH53/eZ1tIVZHOCMZTISdw6X9AbknEsJivJZnYNfcdxywfRJsiQCAtTO8DAlvg
         23CsOTnbN3T/LNDte06SJFPLRxP39zV7O6kh9ZO3N4OpMLFV7VvhS1aDi4fW0ISIIH31
         J17A==
X-Forwarded-Encrypted: i=1; AJvYcCUPd93oFxPOdxRxfD0gumPPJK3H+b3HQO7k/Lek2crpvBbPANobhxd0aD24PwY+z6+adAgfN+t/vUI+h3badei5NIU782LHYoDl
X-Gm-Message-State: AOJu0Yyl49RHcSKVKHS47KTcCUX1eKUbPHyuMgeZ77x2zfph2qODK1Oh
	3fNyjQcIVyOiRVFlmKzSZJ85PdiEJu4Uw9SYKjG9MPctQ/sq4Ul0FXQLxaiMANk=
X-Google-Smtp-Source: AGHT+IEiQUufXTv7FJcYkp/QB82CY+QyZl0A6G8qICn/+gCfoWDUcq8617KoBHtq/0X/7mU0hAwvqg==
X-Received: by 2002:a05:600c:4ed1:b0:418:d2c5:5c65 with SMTP id g17-20020a05600c4ed100b00418d2c55c65mr2438790wmq.37.1713449849699;
        Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:00 +0200
Subject: [PATCH v3 12/17] clk: mediatek: mt8365-mm: fix DPI0 parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=CxkLUlifqvxz1G/Eho8b8T4Is6DgFjTZfGPXl6VYPH4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjTlVje5tb59O8ee6DHe2YEYRuzYS3qUOt1aEr
 ArPtZJaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURQqNEA
 CYVXzwd+84f6xIO7EyRZqTIThqTCaSd0BOLeBN/VzpJk8gHezkxoYZHgiCRin94aHkjaR7VSMB/Quk
 qBq+TiWTMhA1/zaXb41ylAI+Dyew3JUPmpZ2M5T8yDYNnbEjiOAmGrAM9/+9bsp18Y72CDZgcRkkT3
 +VyS01NGZZsojIayz9SpoHYeJfa/MUxZ3tUyle4MMHJYbvkMs9MNQ619sgiQTWiE2+Q41Fv9dY9VoF
 mbVjtEs7R3f79z7ueli540F92j2WQZ4oJZ6LuQ0fGsXezsTGv/qfuoTmBHIVXRVY8p/9ciqrrnl8BP
 LVfYA2WXi8SJBZxYMYEOspJ2EYlIQyIZ03FG/bPJsvB7CYsuC0f4yqlwA8ARd2T6uoG0xHT3VeKS6Q
 sLNan3y/BScJLyDClVjWhMQXRW2CjNcSRVeM32pj6Ja37+B3RfnaAE9k4jf5pfbRkWxvsk7QPDCrCu
 IvPTDwRJhuyrC7BFmfac8T3JAUirPF00v1tjMXILiYfeA3K+Gm2K4SVmd+9EWgjEJcbf6ucCjlQU/p
 Mz7gTttZFPwcSGfcOzz67IGjCR6OlEXErvSLeC7em/u4Sq1gQIleQ5ecPpwKcZ2V5k4TcHwQn1/IyQ
 AREJ37OCcknpY2fMYZGW6FkM6el89Lz6S94SzjFiEJxeyBPQeCxEds2+saJg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

To have a working display through DPI, a workaround has been
implemented downstream to add "mm_dpi0_dpi0" and "dpi0_sel" to
the DPI node. Shortly, that add an extra clock.

It seems consistent to have the "dpi0_sel" as parent.
Additionnaly, "vpll_dpix" isn't used/managed.

Then, set the "mm_dpi0_dpi0" parent clock to "dpi0_sel".

The new clock tree is:

clk26m
  lvdspll
    lvdspll_X (2, 4, 8, 16)
      dpi0_sel
        mm_dpi0_dpi0

Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365-mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 01a2ef8f594e..3f62ec750733 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -53,7 +53,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM0(CLK_MM_MM_DSI0, "mm_dsi0", "mm_sel", 17),
 	GATE_MM0(CLK_MM_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 18),
 	GATE_MM0(CLK_MM_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 19),
-	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),
 	GATE_MM0(CLK_MM_MM_FAKE, "mm_fake", "mm_sel", 21),
 	GATE_MM0(CLK_MM_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 22),
 	GATE_MM0(CLK_MM_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 23),

-- 
2.25.1



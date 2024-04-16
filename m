Return-Path: <linux-clk+bounces-5994-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8A8A7066
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 17:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37550285FA5
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 15:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15D11369B2;
	Tue, 16 Apr 2024 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hdopmido"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4713441E
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282805; cv=none; b=QbjLxKX/caKgofteQb2993+7K+aetE1q/oMgacD+XNx+Km7j9Qplziep0Zw0/qtYmj1QD4JkqEIx6iOmJctbwO6f7bIu3p/8jAIrjHTMGiPe+O+pzKCbT5gNS7jlOLdpGmkMegspcT91gljYOjoCUmHunai8hLNZvNByEHNMot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282805; c=relaxed/simple;
	bh=IeDOCl06JfjlPFghfO35UROWR8m1btVVgKsMaQNA6d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R100KmnXQHv/hJHUE6yGCGj6bJcLwLXfDH/uInmEK3xTwMmMcgHdL+o7dP9cfJvFhJnTTEIJOHqN/7rbs0HGI6pDPgbWjtbQiKwqP/4FMoVrGn54bsypZLAc0y+Cw0XJImfjFukATRQvkF83qCVlN4rl2UR1t43zT/R4OK9WDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hdopmido; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso7386236a12.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282801; x=1713887601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
        b=HdopmidohNM+HsoijDEm6F1Idg/if+/j45EKIzep3S0ENbD6Hv2TqeIqQcS/LHdFXH
         7psecJK2L6p5k0GBqyT+0jp9L8Rk1MQT37asNoYOf1C5uk+fyMXgUkKxU2ie6bOdny4q
         w4+qACg/66VFlCyelVv5ok+P7/qHlE37eayPcEeAn+kSds96YJJkPTrIxbt3Y4Lp6Swx
         J5XMz5pV8JbVC/O5Gal190IElhDXhby4eXsW2t1siGLVP3HUUYV8qPYR0mD3uf0jQQsN
         DjOD/jEOuFRTQn87AwZBl7m0DBCLirnlATmIM8fKq5dOdjAnU5CnzCFACY57nDxMvfKt
         tgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282801; x=1713887601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
        b=ujZQEHJBamqNvKNH/qXU4dHn+vk9uck1Jy3Bwc3yhEN2EbLLJaLOq4Ab8mj1oylzE+
         IzMG+pF6w6hrEBwsR0tZ8jkU45q+4QGAxH93QCnjv8EztJp7p+JfLFMEYWGf6enLnEjC
         ivKKlDd+Mc9HX7/2pUsK5JSuzafNFmlmihEnMm+Fa9Ab5r3zwxrX8vLNWPwg2O3mKSa+
         +OGnkmL0mnISSDDRVz70V7fh8SXuBncz78Zn1YxtfWyeM26Kp6HfJOHdwxXI90YI4NVj
         L4BC2AeRSscD7a2ii/sMz/5an69qo9gluhZRoLshPBDnGPuBbJ/sspNCy71TZt4Au20a
         gCaw==
X-Forwarded-Encrypted: i=1; AJvYcCV6pQvoAu60FQBXF/lozbkjyXeerK8sBHTYy8cF8ZJf1Ru3TKD4XeDB5/Ie8j07dKIwekbseuCSLDVsUzB6zQiwrTEGBejKFBU0
X-Gm-Message-State: AOJu0Yz1xtD/Gq5nIQL+l1nw6MslQO1orjOaec2hHrffQ3pr+m22TFpk
	w0dyPqcn4j8ivCWSIuiiTdZuuSH8wUFc+LEmDGMKIn48SduAb2p0GV6RcGBhHIw=
X-Google-Smtp-Source: AGHT+IFHhEszesK9q09DsR/2xkoSYe02wtLO0cXjArvzx9HgMzPqi6DEF0MkcuxXMCf+zXa2GmXu3A==
X-Received: by 2002:a17:906:d28f:b0:a55:33a9:7f10 with SMTP id ay15-20020a170906d28f00b00a5533a97f10mr2555951ejb.32.1713282800855;
        Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:03 +0200
Subject: [PATCH v2 02/18] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
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
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IeDOCl06JfjlPFghfO35UROWR8m1btVVgKsMaQNA6d0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q+HnTXMENk4xikmBtAqBzPzqGGoQTN87rhFQk
 sL5tZI2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYtPD/
 9Qm+/9xOYNXV0ZxQe+5NoZUD6q0aKZfjTzUxCwH02q5XEjsHWdaLH6zWsDsPkVwMuCKzKcizClDjvx
 NynHcFjOS+89EVdprokd+qZoM14inG7kJ4axYW7ozOAcB6gbOAwBtOmpUsR5/XK9c+iw2vNy4AxL8U
 B4BVG6AfwKhlx0RNzBLgomixGSAddHxIpr5jf0YnvB2LX5z6sBO8FK5P2G3nIbNTu9Q/3q8A6/IrMi
 7md5PGdAKiTK6v2Sl6kdlhKJMUtkNtlPdvvebkfNGOrCSdfnQjhoGG4E+vlHIKBlYIfmLNtQh1tjp2
 xEPAETS0seMkLxfQNT+D574GNpaY3HaHZ9fKa9W+fqad0nBI02IcRjyssJZeDbcz4xAYiw4t1OCIN2
 jyfO79XA6cgbDmS6x+uh/RE3RYZyMNu5O/OILPXtsUVGOvwFqHJnXgCK0Zeh2qHi8jo5GlK/lW8+RH
 0rPz/NkrQRr8Mgs+5xTxN+8cqwvtXvnZh9d8qf3vkjlqcWH5i1lm60sQFjxUcJv8k5ohXBz5hOB2Eg
 zlo5360N1S08YLYo8RpTi3k4bA33I0BRki4k3XzyxiuvjGKtlngWsAMta4R5sSKjbtJWUNAXTxWF3m
 /FiP6xYGFesR7PHXVNjoui9oFDOnQ583ecoKMc1WodBAyB0gxsnDLH7VS5aw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

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



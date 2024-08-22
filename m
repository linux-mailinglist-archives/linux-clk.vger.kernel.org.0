Return-Path: <linux-clk+bounces-11061-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAD95BA56
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2024 17:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587641F21E1C
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2024 15:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD181CFED6;
	Thu, 22 Aug 2024 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BIZZ65t+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460E1CF2BD
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340522; cv=none; b=IBU96ePt0N/96o97lWGdd63AynUkGfL91iZrCwz+PF9Of7db0+XX0Z8dOpJmutuUERxykKX7E1LBD24Sc1mRu4xTTj7lxv4I/SrgSn78f1yVujPokQET9nDvMX500M5ugC0TKyAT8eSu6YyINjoGoy66MJ0Tar3hEPe4+eyeq/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340522; c=relaxed/simple;
	bh=yuidYBMLBf2+VSQJ110PhBMZfyJYFJPb3Vp+ConTnzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPy7ioq/5Y13RerNp/WYBY0x3pWPuZ/VH/psYda/Pq3j5s7gPTldqI9V7uw7S0CmX9PuBLX19wSDNtQvPDbd3ds7oc0hysa7zCfgzhLRNv9CWb9vUnhWsOeW5nkE1jtlmBnet3JgzwZpNLeEUo6xTfNd8TY1Y7OUOxeieidW1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BIZZ65t+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso11228771fa.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340519; x=1724945319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EG858HP8in5mb9F5t+mQtv5qilS1TpleLRM5JdIQFA=;
        b=BIZZ65t+EBCwelqZxt7RgTyWX051Z6YOYkR8N7yRfgSbXa3xS/KwwTb5a90COE4XYU
         SaamMYZuyLZt7wLewii5p4LHIY5cRvR50pOgr9S1ycUU08xOXOvrC3gtyv0p+MQBMsD8
         XscARBcGkSNto4N7IeE6K8lxYSalwrJ7AD1qqU2S+cbrUiOVji3Zs1QW4cAE0d0ZcYzQ
         S5jKxWiy+M6y9fM8PoRc3owa3t1hyc0O4BjguGpzfVx3zDprxtpNTKSi6GtDa8XpLIwu
         IGIOmMvk0MhM7HuN8fr9EE2p7T/+Yf+1mhy+WvIDwRYPZEcuTXs9BbbZCldtC8Bs1QAg
         uxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340519; x=1724945319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EG858HP8in5mb9F5t+mQtv5qilS1TpleLRM5JdIQFA=;
        b=Z8HQCPHFQJsJNs3U0bzoc3VYLLZBlSLtFfN5lIUCmnKwWz1wtLvLnQFtgNXIPG+vLc
         AosxsQ86Z6Ps13RsJFn0UFtIfkuFB83IyhRE71k/Ej9yMLazxTOaB/GbYxw0r+CKxRu5
         5o/pVyEcq443f3DuCoilFjKtdLl4v1MiIFvc/CjK8SRIxNRadTLXh/gQpSppOatoQ3Z4
         ozmfFovvkf6HxzXkNPrW5UXqeEdVnxH4qLhBdtij4eZ2w9N6FgRV007rakKN5C6EfD62
         0TZw2L6oedBEaWf/Zgj8v4+MLPwOPG1E5/IomMd2u0vw5l3jWdw9mDpL5KFZhYu2rRKX
         XrIw==
X-Forwarded-Encrypted: i=1; AJvYcCVh1LrcwOY2oKO6vUHMgwXmSMuAActuDpbtKxi3/9BoxcjVAl91w2pT8vchUTusAAyHwMuEgIQjT5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnC5u3L8Rt3xmyAPehWMddrKJdSL/Qz0hlyUPpPLUMWYiiJqM
	NtnqjIv7VC4M5v7xBEJF6oyPuqErLgCGb7nozgeRts+LAh7tFN3Epm9thcQEmZ4=
X-Google-Smtp-Source: AGHT+IHayguZj8Wa8CKYZZKYCnPQ7ddSFCBCknAgIFfJUW2xU8Ead14TNkyeRYtLahQze0o0yKHgSg==
X-Received: by 2002:a2e:a988:0:b0:2ef:2677:7b74 with SMTP id 38308e7fff4ca-2f405f0057bmr21390771fa.41.1724340518917;
        Thu, 22 Aug 2024 08:28:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/16] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings
Date: Thu, 22 Aug 2024 18:27:56 +0300
Message-Id: <20240822152801.602318-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the RZ/G3S PHY bindings. The RZ/G3S USB PHY is almost identical
with the RZ/G2L USB PHY. The difference is that there is a hardware
limitation on the max burst size used when the BUS master interface
issues a transfer request for RZ/G3S that is configured though PHY
registers.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f82649a55e91..af275cea3456 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -13,7 +13,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,usb2-phy-r8a77470 # RZ/G1C
+          - enum:
+              - renesas,usb2-phy-r8a77470  # RZ/G1C
+              - renesas,usb2-phy-r9a08g045 # RZ/G3S
 
       - items:
           - enum:
-- 
2.39.2



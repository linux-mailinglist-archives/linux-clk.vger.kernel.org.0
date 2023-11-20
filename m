Return-Path: <linux-clk+bounces-316-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18A7F0C48
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 08:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 987912812C9
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A61663DA;
	Mon, 20 Nov 2023 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M4uAiFT6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DAFD5D
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:30 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083f613272so15913915e9.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463689; x=1701068489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf6nqUoubfvF4vGSjIN2fyq3fdRNvhqZWqSw1FrX9lg=;
        b=M4uAiFT6YUuDV/y0uCUdOzfcYkM0BOPWxND9Zsvj5w+dWvtLStoWToeu/qnyvw9EyQ
         FYeodN/JdPpi2wvLND7BnmEGmCtLaOsFAfUW4J/bdbOvizCtsfjHsruheAnoA8F+xJcj
         51eE3pWRllev+b0ZrQWwq13reJt30rd3govBEQYqWJRziI0PlIEGD61H9b5q6UjDmIcw
         5AzqxPoZkyrV5QTT/c7LtpcT88v3c3sE55mVk3aGkZNSOeQ/eJRkMTReGzJp7us9nJZw
         6m76igSsVYXT/nFlFG7yWp1Z9Tuv4XOYcAhNKEf6HBd30dkxPjIP162P4SOZkS+CSeRb
         0hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463689; x=1701068489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf6nqUoubfvF4vGSjIN2fyq3fdRNvhqZWqSw1FrX9lg=;
        b=RXFBrVE2ad0IZj87cNKMb4FMesSHygrfPVvYtjsQNny4LgR38v3vCZkFddMeHzTnVD
         y82O6OtLmTFUPeYnt8NAB92W6E8qyZ9EyXWGhtQzFRtqxMX98cH4PlDn8GRYYGuJLHq+
         MaD9FNCklUf4hQN2SZvnXMhqKEOPNMF3J0A/7WU8HA5/p1OCoVe0KkMXWPSigRLoh2SK
         NuO+qOax3WgFmfAGtbVzBvw0E/LaEgGwp0b7lOZvtbD3nQJDl0h+57E8+XD7hP2G1BE1
         VU1DWnrQBCMgF5C2klMUNgVOPxb4h83r2P5tjN4p9/1jah8xE9PAvt2kvOE6oRFQ/3mB
         S03g==
X-Gm-Message-State: AOJu0YyHRpnJYK7D0yxhHMLWRuNlm6v5K807jkJ8RiCPnxatpuJM6CAr
	MqPtvHxmzOu9AYMDfiLgZMbP0Q==
X-Google-Smtp-Source: AGHT+IEYA480uU3PYmOPPZkYag60VVo3otAt6tbJovUushdq8KM2+SzL0I4iXX1GYwhzP5W6ORWA7w==
X-Received: by 2002:a5d:5f89:0:b0:32f:7bf6:db01 with SMTP id dr9-20020a5d5f89000000b0032f7bf6db01mr4597804wrb.67.1700463689323;
        Sun, 19 Nov 2023 23:01:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/14] dt-bindings: net: renesas,etheravb: Document RZ/G3S support
Date: Mon, 20 Nov 2023 09:00:19 +0200
Message-Id: <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document Ethernet RZ/G3S support. Ethernet IP is similar to the one
available on RZ/G2L devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 5d074f27d462..38b71e687513 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -58,6 +58,7 @@ properties:
               - renesas,r9a07g043-gbeth # RZ/G2UL
               - renesas,r9a07g044-gbeth # RZ/G2{L,LC}
               - renesas,r9a07g054-gbeth # RZ/V2L
+              - renesas,r9a08g045-gbeth # RZ/G3S
           - const: renesas,rzg2l-gbeth  # RZ/{G2L,G2UL,V2L} family
 
   reg: true
-- 
2.39.2



Return-Path: <linux-clk+bounces-15-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A477D7E44AB
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 16:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E77A28123D
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 15:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B672631A93;
	Tue,  7 Nov 2023 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dpY4L3eW"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11E31A84
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 15:55:50 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAF44783
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 07:55:50 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-409299277bbso40825205e9.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Nov 2023 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699372549; x=1699977349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkfSHGrIpem8wzkvHrBk/3Gkd85Ebnq+lcLBg87ITvo=;
        b=dpY4L3eWa4flhXLc67MqZnrpxEIJMf0+wX5MqxWeKAUCPWoN9bdiHmuoqlI28BOFlz
         M/xTcEG33KRQWa05Aaz1bQxE7r3zmBXQc0Zda+6xnqZyCv+FkTuc4As+A5um5WV6kPsa
         +gyZZt67wq/aEP1WbvF8YjmsQD4NkMg+otY3rNyS94ruLbBrvZA6mkgFyxqZA6AZPzlh
         nsSquFgJHHl8vYze7deTu1VaC4jR0jEXHhE07z+3i2s+BMN/pCdVYDMf7hwfRNHJPo2H
         DeFnEj5yK6Lzdr4MlN/sh//IbQzUsmh5XW3tm/OkXmfBP8uj8yb4vUYK8FGSFIHBtj42
         7lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372549; x=1699977349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkfSHGrIpem8wzkvHrBk/3Gkd85Ebnq+lcLBg87ITvo=;
        b=Rhvcb9qnnR3K3fsXc/kqV9z0hdBb6DJrB6ziF6pAapl7GJrbE3U7ytMWDqJRc4cSYP
         ACKzrljJT9lZLlgUWzwphZvYYLVd1uo5l0SJgenx+2SnNfVlP4m2rp0Y+3Cik78bvdLm
         2dbLyOBEGpOf5d9q8I2xQdD5X4mv5WFogYQuf6ek9C5Y/xpy/ICCXI8qujm8k1CfMQFB
         DG38RwXdjP+PJU5JW4p39GuVZgvt4sfnuB/xzyiq+/p5mCcku2zerlPCK+Ht8tnHVONx
         ZeA6C6HlczI5ZJRHWCT0XOJpj+z2jqcbA2sW4K5rdiLBpE2pRv4zrqq9TvtbNorSWS4W
         JoTA==
X-Gm-Message-State: AOJu0Yz+6DYH2ECxkxAKXqGdYJ3aRMuEhvakvIxbIg2wNuE73QaBO50K
	eaKEq04chB4UjRy4SaCkc9m93g==
X-Google-Smtp-Source: AGHT+IHpnyjFtHnxiqNRaHl8atDMuhe0j+p3O/OrAQ+Bopbx3/CIOAepx72DV4yXbiUhAx69OJKUiw==
X-Received: by 2002:a05:600c:1913:b0:408:3cdf:32c with SMTP id j19-20020a05600c191300b004083cdf032cmr3353377wmq.41.1699372548745;
        Tue, 07 Nov 2023 07:55:48 -0800 (PST)
Received: from arnold.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm16579085wmq.11.2023.11.07.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:55:47 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net,
	heiko@sntech.de,
	herbert@gondor.apana.org.au,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	sboyd@kernel.org
Cc: ricardo@pardini.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/6] MAINTAINERS: add new dt-binding doc to the right entry
Date: Tue,  7 Nov 2023 15:55:28 +0000
Message-Id: <20231107155532.3747113-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107155532.3747113-1-clabbe@baylibre.com>
References: <20231107155532.3747113-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip crypto driver have a new file to be added.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a43b16aecaa..f9ae35a13e70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18697,6 +18697,7 @@ M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
+F:	Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 F:	drivers/crypto/rockchip/
 
 ROCKCHIP I2S TDM DRIVER
-- 
2.41.0



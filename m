Return-Path: <linux-clk+bounces-307-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721A7F0C16
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 08:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8841C203B0
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 07:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7374432;
	Mon, 20 Nov 2023 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gZ+ZpceU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E29137
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:00:58 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32fb190bf9bso2983995f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463656; x=1701068456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwevGdkeW/EqmdjRRf8uL4/0rWQsUrZxtLsAgN3TSxo=;
        b=gZ+ZpceUYbalfqGIXbbkSPcAWX72qAJlUlzAq3hRmziQIMAdDmFV4RNt5irfiJ2gsz
         xJJtmlnLcHb0Nca7EeXTtRkFegdHoOCF684yjxL9ana2ir2yxhiQMwsIZQEn15kZGi+i
         zMkmW8P/QxLHjAitWH7Pp+RhNY1RuBtE1+MgNfUsV2m6/rBXI5rsSR7WNLA9eaRrwXIY
         3ML++obL99bTuXgLOqOE5UAanPuIziRgALXiQ+pZIXGQgfcC4kdGM4/7HgvwZGRVTsAk
         3lPXjY/DOo9IvT/S0Y3aTsWfoMQozeirSMyuqlpw0Jw+B8+4gNHotbqJQd61KESkUZ9L
         +XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463656; x=1701068456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwevGdkeW/EqmdjRRf8uL4/0rWQsUrZxtLsAgN3TSxo=;
        b=dNGKv3beGViQFBNvGMRALj3VKBpl/Hbx2fFf2HdsaFGcWfABDg9zgtKavEttOavWP4
         i8zlwEaUeNCC1pnsewMP7RBrfQgDZi1YHkCT6kdeQy6AetSEfmmo+gVnIQcYbhN0WZSY
         WJ0PziVnD1XOcxVW74tKlk1ITi3N20SQzIlhCl+QvfvkGV/egqDIEjevuprsSwN5SfTx
         xjDUeJk6NTevsUCm7XDw3rNQXbHqFXAqUxsB9U4N0i3RtPD+zTJo53QKvJzE2xxaugre
         V6ugz+xinosy8JN2Fg4M1YsEwGzZxrSxpTpWtb7eYkoEjP677zh/l5X28mEDPhDOZ7zf
         7csw==
X-Gm-Message-State: AOJu0YwnscgG6fKugaWdoFt9fdnlnLBOYIXsk0ET68mrWsPXDSkzGSkx
	AXqZR7mljHUim7TnrDjyWT/7Wg==
X-Google-Smtp-Source: AGHT+IHAdVnQoSWtCtHmQxcPOkXYnnh4RinKnklxlmmTnyowZWsyJ8QW2bmmGUpYQcAPA1Di3ZT2ZA==
X-Received: by 2002:a5d:5cc2:0:b0:332:c9c2:dd4e with SMTP id cg2-20020a5d5cc2000000b00332c9c2dd4emr639485wrb.31.1700463656622;
        Sun, 19 Nov 2023 23:00:56 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:00:56 -0800 (PST)
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
Subject: [PATCH 00/14] renesas: rzg3s: Add support for Ethernet
Date: Mon, 20 Nov 2023 09:00:10 +0200
Message-Id: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds Ethernet support for Renesas RZ/G3S Ethernet.
Along with it preparatory cleanups and fixes were included.

Patches 1-4 are clock specific.
Patches 5-8 are pinctrl specific.
Patches 9-13 are device tree specific.
Patch 14 updates multi_v7_defconfig with RAVB flag.

Thank you,
Claudiu Beznea

Claudiu Beznea (14):
  clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()
  clk: renesas: rzg2l-cpg: Check reset monitor registers
  clk: renesas: rzg2l-cpg: Add support for MSTOP
  clk: renesas: r9a08g045-cpg: Add clock and reset support for ETH0 and
    ETH1
  pinctrl: renesas: rzg2l: Move arg in the main function block
  pinctrl: renesas: rzg2l: Add pin configuration support for pinmux
    groups
  pinctrl: renesas: rzg2l: Add support to select power source for
    Ethernet pins
  pinctrl: renesas: rzg2l: add output enable support
  dt-bindings: net: renesas,etheravb: Document RZ/G3S support
  arm64: renesas: r9a08g045: Add Ethernet nodes
  arm64: renesas: rzg3s-smarc-som: Invert the logic for SW_SD2_EN macro
  arm64: dts: renesas: Improve documentation for SW_SD0_DEV_SEL
  arm64: dts: renesas: rzg3s-smarc-som: Enable Ethernet interfaces
  arm: multi_v7_defconfig: Enable CONFIG_RAVB

 .../bindings/net/renesas,etheravb.yaml        |   1 +
 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  32 ++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 153 +++++++++++++++-
 drivers/clk/renesas/r9a07g043-cpg.c           | 116 ++++++------
 drivers/clk/renesas/r9a07g044-cpg.c           | 158 ++++++++---------
 drivers/clk/renesas/r9a08g045-cpg.c           |  64 +++++--
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++++++------
 drivers/clk/renesas/rzg2l-cpg.c               | 166 +++++++++++++++---
 drivers/clk/renesas/rzg2l-cpg.h               |  21 ++-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 166 ++++++++++++++++--
 11 files changed, 736 insertions(+), 258 deletions(-)

-- 
2.39.2



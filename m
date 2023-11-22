Return-Path: <linux-clk+bounces-456-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0287F489A
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 15:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E662810D6
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 14:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AE14C3C4;
	Wed, 22 Nov 2023 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aZPdm/qn"
X-Original-To: linux-clk@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05AA101;
	Wed, 22 Nov 2023 06:14:47 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52A0AE0010;
	Wed, 22 Nov 2023 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700662486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DzA/25uN5wEHeddxB+b44Ua3OPhRo09SkW9tdsJYkfE=;
	b=aZPdm/qnKT4vHHeCbilETxDxF9SwMH6ueiAipJ7b63xFfQH9rqI21GVTCr8QI04kgoCJ/g
	fTGal0Crdf5XZeiK7/Kn/td5H5rCY8Hy8/N/kmzFYj+PULRSqMvn6dTCPZA9hoMhC4xYZu
	rbMiy/xqOcS6RmSevr228STo0n7SCchmxieDJufyOu7S06wS93m+yjY2Xa4smLwIb1xVGC
	2AHijxMHa7mc8oNjkr1x3HAvoym4NnUTwMFgedipT3NcOkPKMQqa5Wn5GWMidnF/aDG2H4
	EHO0B8FUBvV0STzlRyIkoLmd4EXNuGieh4I1LAYujZYCfBemIhNdLw+sRNJU8g==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v7 0/7] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Wed, 22 Nov 2023 15:14:18 +0100
Message-ID: <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: paul.kocialkowski@bootlin.com

This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
as well the as A83T MIPI CSI-2 unit in the respective device-trees.
Overlays for the BananaPi M3 cameras are also provided as actual users of the
camera pipeline on A83T.

The corresponding drivers and dt bindings were merged a long time ago but this
series was never actually picked up. It seems more than ready to be merged!

Changes since v6:
- Rebased on top of the latest media tree, renamed dts to dtso for overlays.

Changes since v5:
- Added BananaPi M3 camera sensor support as device-tree overlays;
- Cleaned-up OV8865 regulator definitions;
- Always declared the internal links between CSI and MIPI CSI-2 on A83T
  in device-tree.

Changes since v4:
- Removed mbus bindings patch: an equivalent change was merged;
- Added collected tags;
- Rebased on latest media tree.

Changes since v3:
- Reordered v3s mbus compatible in binding;
- Added collected tag;
- Removed rejected interconnects fix.

Changes since all-in-one v2:
- Corrected mbus index used for the interconnects;
- Used extended mbus binding and exported the DRAM clock for that;
- Reworked the description of the core openfirmware change to give
  more insight about the situation.

Paul Kocialkowski (7):
  clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay

 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 +++++++++++++++++
 .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 109 ++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi   |  43 +++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    | 121 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 7 files changed, 394 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso

-- 
2.42.1



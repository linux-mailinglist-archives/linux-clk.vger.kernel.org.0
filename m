Return-Path: <linux-clk+bounces-541-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A37F74F4
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 14:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE2D1F20628
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 13:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC9A28DD3;
	Fri, 24 Nov 2023 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="jXzO0DrL"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0042C19AC
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 05:27:33 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1700831882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZABsrju+3feVMwii1H8J45xoKumLKlmUGlla0b8ba5E=;
	b=jXzO0DrLUL7ua5QX/TEPywrG29VAR2py2fqQDxTQGtaD20peAMnLCYPNFuAObVRJ9HJ2c0
	AWN6s9cSudgJtfBr/T8uOXmKVwnSDZvw76ufPgrlcrC9U6RnTd3agHRxehNBWezIsCsmTR
	PRNVRd+SUmOPj08liTSTt5qyiY2KL1zPIcaBZDaqo2QnsPjUkVoWx39t18K0xx5sgIxhAC
	31bGgwBxjtNSMBWmCcgOSlVgVNgZpJ1itm3nlQEisRWPk7VzTGuVkugmYBJSe3jsmM1an8
	r8M6HNmJe5LfSXytw4PhrH4W5vAAWqArUIJTkxmSVCcaxX5HqMzk1aXSFW+FpA==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: [PATCH v6 0/3] clk: si5351: add option to adjust PLL without
 glitches
Date: Fri, 24 Nov 2023 14:17:41 +0100
Message-Id: <20231124-alvin-clk-si5351-no-pll-reset-v6-0-69b82311cb90@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHWiYGUC/4XPwW7CMAwG4FdBOWNkJ3FbOPEeaIeQJiMiSkvCo
 k2o777ApglpB46/JX+/fRPF5eCK2K1uIrsaSphSC916JezJpHcHYWxZSJSKkDSYWEMCG89QAis
 mSBPMMUJ2xV3BWW8smo4ZrWjGnJ0Pnw//8NbyKZTrlL8edZXu018ZByJSUm94kLxloJ+i/XzJZ
 TOexX256qeFl6dUDQhGcdej1Ij9uD+2f2CKH7649GfykynxlcnN9GjpaFj1fhj+m8uyfAP54jg
 xVQEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, 
 Jacob Siverskog <jacob@teenage.engineering>, 
 Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>
X-Migadu-Flow: FLOW_OUT

This series intends to address a problem I had when using the Si5351A as
a runtime adjustable audio bit clock. The basic issue is that the driver
in its current form unconditionally resets the PLL whenever adjusting
its rate. But this reset causes an unwanted ~1.4 ms LOW signal glitch in
the clock output.

As a remedy, a new property is added to control the reset behaviour of
the PLLs more precisely. In the process I also converted the bindings to
YAML.

Changes:

v5 -> v6: 
- collect Rob's Reviewed-bys
- no further changes, resend only

v4 -> v5:
- address Rob's comments:
    - min/maxItems on top-level clocks:
    - remove unnecessary else:
    - remove spurious |

v3 -> v4:

- remove spurious | per Rob's suggestion
- simplify conditional clocks/clock-names per Rob's suggestion
- remove mention of clkout[0-7] still being admissible in the commit
  body of patch 1 - while the Linux driver still tolerates this, the
  new dt-bindings do not

v2 -> v3:

- address further comments from Rob:
  - drop unnecessary refs and minItems
  - simplify if conditions for chip variants
  - ignore his comment about dropping '|', as line would be >80 columns
  - move additionalProperties: false close to type: object
  - define clocks/clock-names at top-level
- drop patch to dove-cubox dts per Krzysztof's comment - will send
  separately
- collect Sebastian's Acked-by

v1 -> v2:

- address Rob's comments on the two dt-bindings patches
- new patch to correct the clock node names in the only upstream device
  tree using si5351

---
Alvin Šipraga (3):
      dt-bindings: clock: si5351: convert to yaml
      dt-bindings: clock: si5351: add PLL reset mode property
      clk: si5351: allow PLLs to be adjusted without reset

 .../devicetree/bindings/clock/silabs,si5351.txt    | 126 ----------
 .../devicetree/bindings/clock/silabs,si5351.yaml   | 265 +++++++++++++++++++++
 drivers/clk/clk-si5351.c                           |  47 +++-
 include/linux/platform_data/si5351.h               |   2 +
 4 files changed, 311 insertions(+), 129 deletions(-)
---
base-commit: f6abdcb2444f6ebe06e19cd9eee767c7c46612ae
change-id: 20231014-alvin-clk-si5351-no-pll-reset-ecfac0a6550c



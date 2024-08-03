Return-Path: <linux-clk+bounces-10354-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64152946949
	for <lists+linux-clk@lfdr.de>; Sat,  3 Aug 2024 13:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F042281EFD
	for <lists+linux-clk@lfdr.de>; Sat,  3 Aug 2024 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E97152796;
	Sat,  3 Aug 2024 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mGa6OwPc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83714D2B5
	for <linux-clk@vger.kernel.org>; Sat,  3 Aug 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722682725; cv=none; b=o7OjpWvrYmTX4KafLuB2TvaB7emYhNi7ZulmrNNZv0aDXQbFvvI4JCfuuoYuI3QIcopvcTJ5qZDV3F3dA7hBpAUK6JX7w3LDubDeHpgVdoxH6t4UuHDEPrDlGbI+YnDCbMjDgoGVpmBJ/Y+GdaFmW+GBeNZsKPn/eA3qC+Nb8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722682725; c=relaxed/simple;
	bh=EBCRVfZznRXJg7v+5Ar3qMNV55WvBT1KwUlciYgpqVA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To/LMGCqPxXiBaOYHIYCn1BJ29aUGw28J9E7saZ01bX49Xy02tsXFTKWnk+ItPo+J+tHXQypjXIsiSbHPVDiZpuWeWBEAsdgIAeKmet9CCLUIX3RGdNh1qlroLd7nL0aKptoy9ACGauxJphHOtTVoosspi5CSHB7uAzktBfO8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mGa6OwPc; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722682722; x=1722941922;
	bh=L8IlsP2aPV2YpmlTJK6/jkHvyJCmhcqNmn7zjirm4mU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mGa6OwPcgWh/b+Vhs6jCYkRHtnie9C9R/Mf9kZL+k32epSr1Pv8PeMCkNtKPS1fV+
	 PDl96eqPMnZIPPyYFLAegyKpPwbGblOFiuKBJYBj8IpZh8RTyD8o2WuKzMrneDk3vP
	 71NK/2L1mt3abu0atpaMY3Gj5cPm29mTt7FHgTnLAFy4epRJgYTagjN/+Jx6Avd0z1
	 g1lDkuP9WHr3UpyF1noAHC9PSVaEGGgC4EHMzcB9qBOm7HY7iprkOl5oSPlSTixp6z
	 ejPYxDK4W3AH9AqZ5KT2PdDRpl1kxaR3gwQ3JQHPMifKrQQd/uXrEwS0vmLFUxZkIb
	 T2au5yPHaOIig==
Date: Sat, 03 Aug 2024 10:58:38 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v2 8/9] dt-bindings: clock: xilinx: describe whether dynamic reconfig is enabled
Message-ID: <20240803105702.9621-9-hpausten@protonmail.com>
In-Reply-To: <20240803105702.9621-1-hpausten@protonmail.com>
References: <20240803105702.9621-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 26a9b51b5d389d6e469395ce25f5ff994c41be71
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Xilinx clocking wizard IP core's dynamic reconfiguration support is
optionally enabled at build time. Add a devicetree boolean property to
describe whether the hardware supports this feature or not.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
v1 -> v2: Use "flag" instead of boolean type

 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.y=
aml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 9e5078cef2962..8b28a01dbb993 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -48,6 +48,12 @@ properties:
       - const: monitor
=20
=20
+  xlnx,dynamic-reconfig:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicate whether the core has been configured with support for dynam=
ic
+      runtime reconfguration of the clocking primitive MMCM/PLL.
+
   xlnx,speed-grade:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3]
@@ -91,6 +97,7 @@ examples:
         compatible =3D "xlnx,clocking-wizard-v6.0";
         reg =3D <0xb0000000 0x10000>;
         #clock-cells =3D <1>;
+        xlnx,dynamic-reconfig;
         xlnx,speed-grade =3D <1>;
         xlnx,nr-outputs =3D <6>;
         clock-names =3D "clk_in1", "s_axi_aclk";
--=20
2.46.0




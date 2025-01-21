Return-Path: <linux-clk+bounces-17301-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD6BA17951
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jan 2025 09:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A92E18837D2
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jan 2025 08:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4501B4244;
	Tue, 21 Jan 2025 08:35:53 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D76F8F6B
	for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448553; cv=none; b=OOhp4NdjErpe6ZghsKrJoHkYj8EzOH51y/DBaXxgw8Uvol7pvZcm5JJvXajyfL7EP2/zl0dvSvsyEkgV3y2oH0PHqMy0X21A5ztB53xxrJK8HsDeoQ4EPloRlCOp4kcWy8zKMR1X3SPQlHdZWqVMbGI2La+UhZhnubhUvNeNtEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448553; c=relaxed/simple;
	bh=VfPHgh0rnBpm/bbjFBR+g0ry6azddMXxASLEga3DLDM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c13GEqNrP8mORYU0F5GxPSZr4nk/EzpZPYGMbH97oVcTPDVGYY3xTAVP4mEi5UIShwcw6BzXJMgVDOD2pg1ADJ0W8yUdtOFb4fxj4cZ8dNdvoKsozaoSCm1+8BYbxmRiIH8OP3A2ZJfbL4OozYYjb/0+Fk8s9f7evxvkmadFi6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9jK-0001zu-BF; Tue, 21 Jan 2025 09:35:26 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9jI-0014rf-20;
	Tue, 21 Jan 2025 09:35:24 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9jI-0001kQ-1e;
	Tue, 21 Jan 2025 09:35:24 +0100
Message-ID: <6018a750dcbb46fe1bd9f653f469d54928c23610.camel@pengutronix.de>
Subject: Re: [RFC v3 07/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
  airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org,  m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Date: Tue, 21 Jan 2025 09:35:24 +0100
In-Reply-To: <20250120172111.3492708-8-m.wilczynski@samsung.com>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
	 <CGME20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298@eucas1p2.samsung.com>
	 <20250120172111.3492708-8-m.wilczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Mo, 2025-01-20 at 18:21 +0100, Michal Wilczynski wrote:
> Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
> controller manages resets for subsystems such as the GPU within the
> TH1520 SoC.

This mentions "resets", plural, but the #reset-cells =3D <0> below and
the driver implementation look like there only is a single reset
control (for the GPU).

>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-=
reset.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.y=
aml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> new file mode 100644
> index 000000000000..c15a80e00935
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 SoC Reset Controller
> +
> +description:
> +  The T-HEAD TH1520 reset controller is a hardware block that asserts/de=
asserts
> +  resets for SoC subsystems.

Again, plural.

> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - thead,th1520-reset
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 0

Should this be "const: 1" instead?

regards
Philipp



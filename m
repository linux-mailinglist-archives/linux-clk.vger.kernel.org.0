Return-Path: <linux-clk+bounces-16218-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D269FB09C
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 16:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADCA77A1362
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18D5383A2;
	Mon, 23 Dec 2024 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/8PDBNA"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D636748A;
	Mon, 23 Dec 2024 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966974; cv=none; b=fg6V8jsZBbK/BoCWxzrAWAidTnpjcyJVvqyXrKU+KcQoaM7bHCQTsZe2GXN+OkMasoCM6pkjMTHjNLw/AqY6f312YVHlHPclcV+RfcnX/lSJg+xMt120nU2QHpZmTsm9KjQcnGo1MnmBuSHLY02fCtU+SBl+nPiR7VLhfMuO3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966974; c=relaxed/simple;
	bh=BB3R4LhpT1qumoCcyu94hcb/+Z5AodbxcVxv7XXNnlo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=D+5skRbPLVnTkDFjcLGAiILLpG3+MR+/+xod27q36ugox1MOd9VVe72MQCBgSAr++j0w+yUcQugW1DXBQsh/C6lmHMW0JgpD+VMQsypjMAlwvs8hsaeHPGK47cYPmkSWGa0w8CB1Z9ftF/zEHn67F3d35eJkJ6d0ie7XpaqGtvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/8PDBNA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABA3C4CED3;
	Mon, 23 Dec 2024 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966973;
	bh=BB3R4LhpT1qumoCcyu94hcb/+Z5AodbxcVxv7XXNnlo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J/8PDBNAjDsbMHT4ohKjjYowkPAH8mHtko322ltly9LGNpsGn2abCfbajgZjkxjiG
	 eWAEJNKTFt1BOllO+CrxjZg97NPoeWTng+3BPQyK5YsNDVjvJiiMlzVKXWMNk4XsRV
	 rH9ia4oQSTR/QZ2B9+ibwQlr+PSGYVsDLHgmpvaknHODudO+5TE+0FOAx+PNJy6lv1
	 oUwNgZeUtMCUtf+58quO0uw3w16aT9XTZllfis6IXgtwo1mkNCnVwOxwn2KyGB1wRO
	 x20tu6Q1LmafO/5i6X5pxUUdUL4CBzrBQckDb782bczHoXH+huTZB93wBNFpBL+C+X
	 1dg9lLVjt/+vw==
Date: Mon, 23 Dec 2024 09:16:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, sboyd@kernel.org, mripard@kernel.org, 
 jassisinghbrar@gmail.com, dri-devel@lists.freedesktop.org, 
 m.szyprowski@samsung.com, palmer@dabbelt.com, jszhang@kernel.org, 
 aou@eecs.berkeley.edu, airlied@gmail.com, ulf.hansson@linaro.org, 
 frank.binns@imgtec.com, linux-pm@vger.kernel.org, paul.walmsley@sifive.com, 
 devicetree@vger.kernel.org, p.zabel@pengutronix.de, 
 linux-clk@vger.kernel.org, matt.coster@imgtec.com, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, drew@pdp7.com, tzimmermann@suse.de, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, wefu@redhat.com
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241223125553.3527812-4-m.wilczynski@samsung.com>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
 <20241223125553.3527812-4-m.wilczynski@samsung.com>
Message-Id: <173496697225.830201.2249501258776075204.robh@kernel.org>
Subject: Re: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add
 support for power domains


On Mon, 23 Dec 2024 13:55:37 +0100, Michal Wilczynski wrote:
> Introduce a device tree binding for the T-HEAD TH1520 power domain
> controller. This allows devices to specify their power domain
> dependencies, thereby improving power management for subsystems such as
> the GPU. The new YAML schema describes the power domain node for the
> T-HEAD TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-power.yaml    | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/power/thead,th1520-power.h    | 18 ++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: /example-0/firmware/aon: failed to match any schema with compatible: ['thead,th1520-aon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223125553.3527812-4-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



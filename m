Return-Path: <linux-clk+bounces-9265-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1E92A549
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 16:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D8F2822A5
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E0A143886;
	Mon,  8 Jul 2024 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E56JMMZ7"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B511422D9;
	Mon,  8 Jul 2024 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450772; cv=none; b=fDxxLdHvyxz6hzZW2gt/r8HHvHLvDkxKu0YSZ1Vy1KEOgFaWGpZowcxMATiMnTwkOwfBdj970yfjcCHSQ6A8+gGxxZcj4rtYoPzhePNUAWZkUDQZ3joKtKF04COpffgBXbhED69eLiae+ABDfO03T4/bI0Canze54GLcgzo8TzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450772; c=relaxed/simple;
	bh=gwDToxlHGCm/VCrMKh2wpHW+kjRAq6Vtk35qLTKuUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pm8E28BCZGXKfERzKy0xyTRSOSPeqShapp+35Zm4cuEWk5baPrFs0t+av9bGK5fNl9Kk4cJ2BmbFcoyivrHYZ9tcyWCirMZ1ITRfeMhPNlvfOSQ/RVvhpzDOWJ/PePt5v7UL+I3q0vnNXTwKpHh0jNT8fcpq96L2fqupjadJft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E56JMMZ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB8EC116B1;
	Mon,  8 Jul 2024 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720450770;
	bh=gwDToxlHGCm/VCrMKh2wpHW+kjRAq6Vtk35qLTKuUnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E56JMMZ7z+KLBtRJDLOqJ1/8c3dbaajSwUMXGK6EjbpTkMGrGNuUp8Ei43cY05tpJ
	 6vT2Iv1QTWreT0gI06gToopdzHCNJcxRuxGhFvsSq7PfLvILfWL0sRTCnIZxHPqhJ8
	 oo4TjOef4AVwsuNRBMS/qlDM0+LuWEj1aUcJPkmlde2IglYNLiRTvxHNdt0L6eKqPY
	 wiWTa00cfUFn2PN2i/Cg93u7GIk1k4kHdDHcBSDwT2p6D6vixMzasUwZHLyrtmiQNd
	 yXvW3SsAdAJPv1TjuZh8iTSAJQlwcLCTwafk5dmCKwEa8u18zoeZq/4WjrK8TYMyO7
	 XFhmDvylyAx4Q==
Date: Mon, 8 Jul 2024 08:59:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: clock: qoriq-clock: convert to yaml
 format
Message-ID: <172045076814.3181978.17624624468773149473.robh@kernel.org>
References: <20240701205809.1978389-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701205809.1978389-1-Frank.Li@nxp.com>


On Mon, 01 Jul 2024 16:58:08 -0400, Frank Li wrote:
> Convert qoria-clock DT binding to yaml format. Split to two files
> qoriq-clock.yaml and qoriq-clock-legancy.yaml.
> 
> Addtional change:
> - Remove clock consumer part in example
> - Fixed example dts error
> - Deprecated legancy node
> - fsl,b4420-clockgen and fsl,b4860-clockgen fallback to fsl,b4-clockgen.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - split comatible to 4 groups.
> - drop empty line
> - change sysclk pattern
> ---
>  .../clock/fsl,qoriq-clock-legacy.yaml         |  84 +++++++
>  .../bindings/clock/fsl,qoriq-clock.yaml       | 207 +++++++++++++++++
>  .../devicetree/bindings/clock/qoriq-clock.txt | 212 ------------------
>  3 files changed, 291 insertions(+), 212 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,qoriq-clock-legacy.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,qoriq-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qoriq-clock.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



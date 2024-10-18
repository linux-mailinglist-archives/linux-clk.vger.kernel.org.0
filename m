Return-Path: <linux-clk+bounces-13392-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF29A482B
	for <lists+linux-clk@lfdr.de>; Fri, 18 Oct 2024 22:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D2C1C2245B
	for <lists+linux-clk@lfdr.de>; Fri, 18 Oct 2024 20:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CC42101BD;
	Fri, 18 Oct 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOoyZEA8"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45220FABD;
	Fri, 18 Oct 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283610; cv=none; b=fwTT40AkPta5KKUneLbFvcHiBGbAwK7WaI2ARTPCYST5QlipW7b7yNnWVHv3r/a9AuWGt28KSnajnRtZtHqkxurPQ4orZ0j/+PHS0qfxsk0N8qbgf7XFETCX/POIVEcd0lNoW4jTPw0FyKurUezPNMhHTFH6w5C8qWx2N+tJtHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283610; c=relaxed/simple;
	bh=8RgkMHQnDnTBhwJbh+8HOHYaoBgkjMwi/ekHrLB3vbc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=mLzjvFg8mg/AriaWVBHsX3WVMFWKp15HyWCqRMyHZSFmD/IqkOJQG41g71roU5HKNWccqqja0NeVUMIwXCOm7zO/x+izqKuoOPls5V6WHFlWc0sXJm5dvXOLQ3ORc53HfbIFy9EzywYEsT3vfIHfqRuh7RtCnGi+65pY11IZ6PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOoyZEA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EBEC4CEC7;
	Fri, 18 Oct 2024 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729283610;
	bh=8RgkMHQnDnTBhwJbh+8HOHYaoBgkjMwi/ekHrLB3vbc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SOoyZEA8xvIZBiuSXTEaxnxMVSpBI6XjkBcMpPS7pKkn+N6CeHDHw69EZC4hAZ2nm
	 zykeWZJSigEY3kGbNz7c6Ribqv+OiCgdgbj1UVY4fKV1UYH7kawFmxdV/XxlBpNUWu
	 ZCOhGhXTpy8JgSGNd9I1dVGUJXxpurgOkIWqyp8RcgjqKxDkMuzZvymPGYgdmbR8X2
	 5ajcBFVqC926MybrGyow9fuiFfQt2iG6b+pFsuXCT0QFf/rb5BiNAJIcuevyZqFneA
	 R0DGsWVHHPyAvUK7yRFecPXN/DDqku5fD8uoT3D9Mnq0VZNsu1i6w8NdJST7jmnS/8
	 RbV2FalMP70tQ==
Date: Fri, 18 Oct 2024 15:33:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-9-4cfb96d779ae@quicinc.com>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-9-4cfb96d779ae@quicinc.com>
Message-Id: <172928360590.1569447.6799165783921516176.robh@kernel.org>
Subject: Re: [PATCH 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller


On Sat, 19 Oct 2024 00:45:45 +0530, Taniya Das wrote:
> Add DT bindings for the Video clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
>  2 files changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241019-qcs615-mm-clockcontroller-v1-9-4cfb96d779ae@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



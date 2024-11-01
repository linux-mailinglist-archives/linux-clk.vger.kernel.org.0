Return-Path: <linux-clk+bounces-14149-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BED179B9078
	for <lists+linux-clk@lfdr.de>; Fri,  1 Nov 2024 12:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D551F221A3
	for <lists+linux-clk@lfdr.de>; Fri,  1 Nov 2024 11:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59119CC22;
	Fri,  1 Nov 2024 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENUWM9t2"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8919C54E;
	Fri,  1 Nov 2024 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461341; cv=none; b=ptUtOGAXEPocwfWm/jHksSCUnFE90i5qUM3RfFb0mSMOn65iEoZKzO/bFUaaVZS2NXMHabyNJJG+x/3XimfTCbxE615OFPYUzSgJ9mp+tw5VDnYdNYDP5T1Uq7fYs5NAxC7PYYBK20YB8GzB92lNtF4gkHBn5EuJcnEjtPqKzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461341; c=relaxed/simple;
	bh=TJK4dvAq0cz5a570yGOqBOxxnqLlaSDmkpM6PTTcWBY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=f/uPLMzWih0itWdM8Qu7iHFX9xCsEITcQM2PbY+AurEJcX+/+yEaWxB0NCI+L8P/TJHaeyZLGiAVj0r849J1ZhA4xd7QoNNunvUp2lXeMnLniOk0Zk1lQmklVPNm4vdT153zZPWYdZ1r45oFnTdS0F+O7S41eaxSLoNuGEz7RfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENUWM9t2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97595C4CED4;
	Fri,  1 Nov 2024 11:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730461340;
	bh=TJK4dvAq0cz5a570yGOqBOxxnqLlaSDmkpM6PTTcWBY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ENUWM9t2Lyk0GNAbn7+NOtEzufxSgi09o+n/O83j6np1IJD3Ir7W1cJ1pzYMFQScf
	 HnP51rUltsb2LKa1W062b4R1G0srozLt1zG+paEH7aefdq8R2WQVoFbxm9lQyzmeee
	 I7xrl7eKV3iQiQmLLiqmzsOGiYxuZsRDRbTP3hepUXptoDMTvCoYpUu1fDVxaWY0sP
	 HG7HKbL8OCU5cE4P/oirvxu7DM9uQWToVTs389FgUe92YLCKJrakBz06eQMCdKhdoK
	 NJQgix9I9pWzwoaHFAlD7KHIIVK536Wi4XwP0To0hKIyl+3MLbZJMhCCMt+Hmw/bxw
	 I6upao3711Iig==
Date: Fri, 01 Nov 2024 06:42:19 -0500
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
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
 Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, devicetree@vger.kernel.org
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com>
Message-Id: <173046133636.2741841.14625258150070202056.robh@kernel.org>
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller


On Fri, 01 Nov 2024 16:08:19 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



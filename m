Return-Path: <linux-clk+bounces-13517-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F749A9919
	for <lists+linux-clk@lfdr.de>; Tue, 22 Oct 2024 08:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6746B1C23592
	for <lists+linux-clk@lfdr.de>; Tue, 22 Oct 2024 06:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C932E130ADA;
	Tue, 22 Oct 2024 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKeBs/o5"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835D1E529;
	Tue, 22 Oct 2024 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729576920; cv=none; b=lXmz61UjcpwmUROGoLR99NCSxw5kuLFqbdYZ8nrGvOUpwZFd7UxVQQaRFSxjslsWi+zUV7JOe08Xtp1eP9tno4SMQ49Bh3VHXbMQHBG/PwFAQG8BKJ5/ZLpeszLHonoTQEvxl2mzqo3NcmjX4Zln//GLtA+bC1+y4H7wlH2WTu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729576920; c=relaxed/simple;
	bh=MGImuF7yxF18wWMhIaq8MfLI5uGcJzKnDjGgJzzCCwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XneL0533VzKkkHaR6sp0nMVmayEcvHtFbb55kXZsyV04NY091THxq2FK41U18KgedXAJyrww1awoIA286eAeUCxWB9DpkcFL8ohTkUN+HMI2l3CekkZmMqE/nCeuhJj0LtD7d0VdvvEKxdx5t0YuhuyzHO5jRhqZw0gYD+Dm4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKeBs/o5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD40C4CEC3;
	Tue, 22 Oct 2024 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729576920;
	bh=MGImuF7yxF18wWMhIaq8MfLI5uGcJzKnDjGgJzzCCwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKeBs/o5fmQAUbvvQVPPS2g2UWONr23aDN9yTWiOlw1dtUloG/aSXSyUFEcZw9IlA
	 tbk8K/XpeAB7QebxcKHUOocdKjFZXd30zd73MUHNAoRLvBmMnWP2McLnw4Mp9192p8
	 dVRnTyCYaS9uKUJ7F/CaFyYJkLwUuCvUO2R6wMoIu1PZusJLDpmlxHvAAGVGiUCp5J
	 7wmHh5RD68xY1+NvJzASj2qYmkMIjm9UBsXU1X104glVciP0LS/wBONI04zkZ7m1qP
	 2O4nOVvzakofaJKhYpnBKsNe8R1PjCFQ+C7XyCNHMslRpFyCDUNiFi5zXYgFAII1fO
	 YqXfNealvq6Bg==
Date: Tue, 22 Oct 2024 08:01:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <da47ugibewtz6zyezkaxpvver47pp46r62mabls56pleb7nqdy@bwuwbenkb2zw>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-3-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-3-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:39AM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>  2 files changed, 170 insertions(+)
> 

That's some duplicate posting. I already reviewed some of the patches
here, so please implement that feedback.

Best regards,
Krzysztof



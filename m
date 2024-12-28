Return-Path: <linux-clk+bounces-16421-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B89FD9F5
	for <lists+linux-clk@lfdr.de>; Sat, 28 Dec 2024 11:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA1D3A12B9
	for <lists+linux-clk@lfdr.de>; Sat, 28 Dec 2024 10:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76501154C08;
	Sat, 28 Dec 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjrCs2lQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450A73594B;
	Sat, 28 Dec 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381891; cv=none; b=BpknKWxtjfKSk2bQDX2qI+D7PAQ+HMTpOKnZP+MmQZWWklhxfcL6ZgAfuMmRfXHByM3z0DvogEgtzBgRYfH3tBDc2oiTrH4kkFwJBP2Zx7C8xwGlODLTOhkYqNYmbH8LP1OUGB4gqUxBmufa2nKU9SgeKk0owZgSOv6BUYWLVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381891; c=relaxed/simple;
	bh=R+N2ulRyyj4318KMaoUmCVXwKEREQLoZ0jGmcovZUyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr4s/5ZU9acaIm+vKX05zHtXAd8AeBzbVQK2HQqYncJlOx6PnVOj9nASHGRsgr1qNVS2Lm5D/+E5jkGV+iqs1HIUFjT2jNyHcBx+yvoEp/SV10WHEqgxMO8W39e1uSaQ9MHp3vTJTzOFfqkN0EodB7DAtSvXS1L+yINuGnqiCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjrCs2lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B3C4CECD;
	Sat, 28 Dec 2024 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735381890;
	bh=R+N2ulRyyj4318KMaoUmCVXwKEREQLoZ0jGmcovZUyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjrCs2lQBAozdBH/8fzNCmlEjQlsUVCMrb6xBX5I5Z+k7Ue5NHYlMlajrcro/1hch
	 bTWJfirLlD6MlhKsfjvfFjTHqIzYQ35Cj/IMtf4ErmedIDWO54TbEO6ngctVTbfJKT
	 9vLXq7qgWUuPWb3lc4Le/6q2SBZFS/NKdAOFoVKqv3pwf2L2CmL6whW1pTdtK8CJqz
	 IrVPlLhsszZa4GqzMKxfd8JJhBsiVXvoI/JgcK2wn77Md+JIp81tshd3/678q3VVpa
	 2iacbevDC1ZbK6DAQlxx2+d7ovmDWId59gUoflJeV5dWHI54S66cj+7vHgHiCxFrhO
	 hSHuj5eRfQRFw==
Date: Sat, 28 Dec 2024 11:31:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom,mmcc-msm8960: add
 LCDC-related clocks
Message-ID: <2swtmbgefqiinlg2h3juojwww6zbwsc2kgyqxtrpfdpcip7rgi@hbebl3nvja5b>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
 <20241224-apq8064-fix-mmcc-v1-2-c95d2e2bf143@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-2-c95d2e2bf143@linaro.org>

On Tue, Dec 24, 2024 at 12:12:14PM +0200, Dmitry Baryshkov wrote:
> APQ8064 / MSM8960 have separate LVDS / LCDC clock, driving the MDP4 LCD
> controller. Add corresponding indices to clock controller bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,mmcc-msm8960.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



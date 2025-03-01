Return-Path: <linux-clk+bounces-18767-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B92A4A991
	for <lists+linux-clk@lfdr.de>; Sat,  1 Mar 2025 08:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E6DA7A9666
	for <lists+linux-clk@lfdr.de>; Sat,  1 Mar 2025 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75421C5F1E;
	Sat,  1 Mar 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3i25GKd"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661791EF1D;
	Sat,  1 Mar 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740815199; cv=none; b=hpg2OPj8x75gciIpVMwPXI3XEtfWwfezgfF8XGeFMpVd+rvngwIr9MK7q6Qa+eYM/epUGtp6P+FG8u904ZrdV6cWD9R2XlCCEzIoBbaoavbhLB1FvYeE49FVaBC9lo4VtZ7+m4E/NLoSZm5meRsuBFr/gHx17AjmyQgpbGPzn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740815199; c=relaxed/simple;
	bh=T+ZH6Z4xoVhm2ILQyatQsfA4AMSbIyFGfcFpAnT/ieA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZvYTZuq6sgf35QhpKMW/cFPQcjg7WVdHcPBOw8EmT7YNsguqryDDRegbNuseSx2InNc5/T8/5amN4QTE2n69uSqy4lIEs0/rBrzwCR2rtgkPf7RyDJFd0GPJeH0rl7vM7ogyNTA/yBQF/bTzOT6KyRm/RHDzLErUWApKqmpmwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3i25GKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFF6C4CEDD;
	Sat,  1 Mar 2025 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740815198;
	bh=T+ZH6Z4xoVhm2ILQyatQsfA4AMSbIyFGfcFpAnT/ieA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3i25GKdnVaDdTmjSfJpe2iMJNj55lWgOKVg3AlcRj9lhyMMYyOHb2aJHl39UATns
	 jLr3VqN7kuijX1JwFfBHMsksWI63V2TZ322h8opfiTgkFOMBHW7KwnegB4mbsT5a7m
	 V6yQNJcUOLnnLCQIzXoSj+vw3Na9BOOehaMoyjh/9HGnf5+zgH8R02DeDRzGQX1vZQ
	 yPKi3u/LgCd/QS5uyrcJsFlpLT2WHDcgSL/h+ilR42xTmBzjwuHNKi+AjaXZZ7nvr/
	 nV4+EkEFDwHolP0WJCbMCESuiWLAWFSFJmZdPFvz0f1tFg0nLjyy87hgUohKXO9NP/
	 Bt3mP81UxrADA==
From: Will Deacon <will@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Daniil Titov <daniilt971@gmail.com>,
	Dang Huynh <danct12@riseup.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH v3 0/8] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Sat,  1 Mar 2025 07:46:25 +0000
Message-Id: <174081358091.1616995.4166112946005132135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Feb 2025 02:56:15 +0100, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> [...]

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU to SMMUv1 compatibles
      https://git.kernel.org/iommu/c/7506be7d253f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


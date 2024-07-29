Return-Path: <linux-clk+bounces-10081-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6A93EC2F
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2024 06:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 228561C21A10
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2024 04:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66DE12FF72;
	Mon, 29 Jul 2024 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4Ew1T7Z"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA712FF63;
	Mon, 29 Jul 2024 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225530; cv=none; b=Mlsk6bYVPFKOqwmtuLDpDr1bG7uC6IvNGvAuI5MIe4iAq0xZrICv9AMd5fU2B+p/YtvUNvFn0Api/9jZ9VXPMj1GzgAfeJzgHIaX3qmMMAjsQbdmt9tXy9Q1VBBwEJO9/njmWJQXgZ//xjr8HT+TP9SIIfMJFFu4Xv7b44Vy/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225530; c=relaxed/simple;
	bh=CvMN9y8YG2fZgADKkezN6YvGt50nndynPXU+DTrYzgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTvJnG9NZI9QqahCA3FpU/R1a+DgGtqVmR967o3EhfeLZyiDxBZZKqEvCLIXljmJOn4i2iwqJWw/QsHOe2xqYMNi4P5EFul1HZWFODB6n5GmspkXTVRAcZ3Jy9E9xA4SWhrCMvWxd4uaB9XRVtwkKZbnkd60OYuhlCOUwWFf6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4Ew1T7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C461C4AF07;
	Mon, 29 Jul 2024 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225530;
	bh=CvMN9y8YG2fZgADKkezN6YvGt50nndynPXU+DTrYzgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e4Ew1T7Zd8yG6ZEM3xSjVHXMsHkR3tFJ7T7/CKK+KVBlDBkVYpbjRsLZ5rX66/Mtc
	 FfniOkPPyEu/5wT0G+Jz5FRTRJjAzNCCGYKK8C78VA7ulg3MIbGGJyjaMIpkXGjEdx
	 dbt6L8A/GSpuz6vuc19sVgDIXC0uSxEVMxkzP3NbUPf/DNI64dNADDGfXVtWCuciHB
	 UZ1w/KnnQ8bbuvAQucpwILTvD8+7ovqXKJ2LNbSNRZJ0UrW63zspuetFwMEZ596aWw
	 dwswByv/0tmKhbiCGORJ1j6O8HuL0Rdpv3o/SCxtMFWWRKkXNOb/lyvGMATNzPj8Hs
	 tRktYYFrTW+9w==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Sun, 28 Jul 2024 22:58:16 -0500
Message-ID: <172222551320.175430.17374920333342835829.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719134238.312191-1-manivannan.sadhasivam@linaro.org>
References: <20240719134238.312191-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Jul 2024 19:12:38 +0530, Manivannan Sadhasivam wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
      commit: ade508b545c969c72cd68479f275a5dd640fd8b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


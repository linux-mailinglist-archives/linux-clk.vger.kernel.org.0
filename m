Return-Path: <linux-clk+bounces-3393-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E431884C6DF
	for <lists+linux-clk@lfdr.de>; Wed,  7 Feb 2024 10:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DEEB23BB5
	for <lists+linux-clk@lfdr.de>; Wed,  7 Feb 2024 09:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0F5208BD;
	Wed,  7 Feb 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AA9tlt0e"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9205320B03;
	Wed,  7 Feb 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707296839; cv=none; b=J3nIfZmSTh4K5PDZRfBEBs7QteARQcwXnwm/nH5Qd8i5hQVcy1H6DkcCO4/Kh/acgCoD3p9qAQeQfV6pbPhbheLoe/8jrME0PtVSXOX7J9SreX6csEpkIOMchbGuqVsQK6pycvPUuKZpJwUEUN55gfEKy7M/6ycmbXTcp5YMI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707296839; c=relaxed/simple;
	bh=vzywu5IswpNrXIxbT6TvtMwzem9EQ7EDDDB9P61uUzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8ZBVeHpI/7jYjRBZTAHRPslIvO4uS7q5rSKwTXe06pn9vB0vwKXSrjoy93p/OYVLw5KWYJz3seP++k29LxxWcWNrnyjYn9KEPw+nE1piVvL1w7Sl4zmgR1v5L5VQUvnxsmkr9BlDw35anRhIpmwS7TJZql4PfYKY4bsgIzy3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA9tlt0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B0CC433F1;
	Wed,  7 Feb 2024 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707296839;
	bh=vzywu5IswpNrXIxbT6TvtMwzem9EQ7EDDDB9P61uUzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AA9tlt0eHXoJfI6RgIJl94FdEkz+Wnf2bgd2NhBMNyFdXngnzwLK9sNYTyuGxaCTg
	 8+IDtMP4CNdjOTntGO7v/2OwFimJJJlkBQemOLepM5coJtMCfsHQtM5EtDZdVzZteU
	 o+DQonhhCrTXkJJr292vmL0M/NMzFa4kD35H9RkLNmyWxLF4q6NdJXcWf4VVeGIXLp
	 +TE1r7QBzGpyTFPdqLNTMtnwkhaPLenic35Z9eFanyEc6IgjyEu5Pqxu8lQEpe6UAM
	 OKdzImvSfG5+k6nb+aqbXy7Fxs6AZdKC9hXup+wOrdStRbEWnWT4ttpaKKeFTDZ9Vr
	 jLEd2am4c5cvQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rXdtv-000000005zh-09RT;
	Wed, 07 Feb 2024 10:07:27 +0100
Date: Wed, 7 Feb 2024 10:07:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 03/18] clk: qcom: reset: Ensure write completion on
 reset de/assertion
Message-ID: <ZcNIT-NxKSZ44NjZ@hovoldconsulting.com>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
 <20240105-topic-venus_reset-v2-3-c37eba13b5ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105-topic-venus_reset-v2-3-c37eba13b5ce@linaro.org>

On Tue, Feb 06, 2024 at 07:43:36PM +0100, Konrad Dybcio wrote:
> Trying to toggle the resets in a rapid fashion can lead to the changes
> not actually arriving at the clock controller block when we expect them
> to. This was observed at least on SM8250.
> 
> Read back the value after regmap_update_bits to ensure write completion.
> 
> Fixes: db1029814f1f ("clk: qcom: reset: Ensure write completion on reset de/assertion")

This commit does not exist in mainline or linux-next it seems.

Johan


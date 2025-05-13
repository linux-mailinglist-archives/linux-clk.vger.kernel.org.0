Return-Path: <linux-clk+bounces-21832-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF5AB5A73
	for <lists+linux-clk@lfdr.de>; Tue, 13 May 2025 18:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D928679FE
	for <lists+linux-clk@lfdr.de>; Tue, 13 May 2025 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8856F2BE7D9;
	Tue, 13 May 2025 16:42:22 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A62A2BE7D6;
	Tue, 13 May 2025 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154542; cv=none; b=QLI1O7/k/kDg8721zxEWp00gM7e3Sr7l81zmBoYwd8Y1bh3/jhLPAq0MbxnvomVELNyvDk9JsxBxGPLgLCHmACcKMpH4vI+nJhs4wxh+Q+2bAg5tdhSBWEa7+mS1M84kuiD5PoLm58JgoODICTcPJRRrEo+5Y02RrSB6eJPtFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154542; c=relaxed/simple;
	bh=VKtTAYAcS0XyLcItJQfXWYeqY5msuzkNIZh0yUYxyvY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nbN1Cc+yo6gqWEEGwlnGmXcdpotXug0DP8h7RLMez9yVwjt577UCbh5a5yyiyAnYfvWV5Z6zfCx4ieGfYVGYWtt+CKT3LJPv3j/7MAC4WcSRsMwRel7rRi90AzaFGNB0gkq6aOar8HDp2+/YYM9uDDo++9g+vyEhmLyValGlqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF11DC4CEE4;
	Tue, 13 May 2025 16:42:19 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 585885F806;
	Wed, 14 May 2025 00:42:17 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250501120631.837186-1-andre.przywara@arm.com>
References: <20250501120631.837186-1-andre.przywara@arm.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: d1: Add missing divider for MMC mod
 clocks
Message-Id: <174715453733.4022265.13446217787280625298.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:42:17 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 01 May 2025 13:06:31 +0100, Andre Przywara wrote:
> The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
> just as other recent SoCs. So far we did not describe that, which led
> to the resulting MMC clock rate to be only half of its intended value.
> 
> Use a macro that allows to describe a fixed post-divider, to compensate
> for that divisor.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!

[1/1] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
      commit: 98e6da673cc6dd46ca9a599802bd2c8f83606710

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>



Return-Path: <linux-clk+bounces-3514-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA8A850A27
	for <lists+linux-clk@lfdr.de>; Sun, 11 Feb 2024 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420C028189F
	for <lists+linux-clk@lfdr.de>; Sun, 11 Feb 2024 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1773E5B67B;
	Sun, 11 Feb 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="cnVsoZYH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A5F54278;
	Sun, 11 Feb 2024 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707666909; cv=none; b=Gm3B0Pn4zRUzf7FYO4pdZkqDip3mgZh+QnGj0kaMMfk8gJAlZIzjCVEPvYv+fJNn1ykVLIOMT7fpNJgUNXClnk8q6j4y33WYG5pU6qi0aTyvbr74bB5p9uSqmPCLvQY9OZNaPxbEDf6cLCe8OROSoFamFKMvr3aq4fgIGfuoWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707666909; c=relaxed/simple;
	bh=+p/TPMiKZKlmXoxJMQ/Ac21V0WaExMeOFivDJAjmfCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAod2FEkwQZ2CRjbhG9o2fZqNr7DAhqo4xNIG5KPGl2zcwYKezNk00az+rXdRIXaHQxCr9/xuS+K26x/VRSZHG7xr/oPn10A1+EeMR35TqKaSKaRF6mtfeb6dTUc9npzelKsqSuDUtRlLP1cvxgZ5iEXD8VacogaLzuPRPB6UoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=cnVsoZYH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A0D5820751;
	Sun, 11 Feb 2024 16:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1707666904;
	bh=8M/NTInG6Nop42RnQgfHsyNKhHaJCOtRgNV478Trz5s=; h=From:To:Subject;
	b=cnVsoZYHZj3wakEHaE3KqHdWFZRhHvPtr03SyIlO4jn5FP8usu86QomBnG5UgPCWS
	 cBe7+Qje074Ri72ZEtjZhQIQCzKKsEVCLfsQQRJpHibC8pj5q+y1kpbqSuFQ5rG3G4
	 iXY/DYLzq/WlN8XIKYPLqVPR7itfjstv+NPE0qgK39OK9YGRGfh7x9NL0zShJQXQew
	 XTG5Mq2EdM/yjJN+EIJX0zao7ZrjyvMuWMV+BD706waEG1jIcMzYvOj9dqnqC6bu4B
	 IdHBl//d3NzIYTnl93VSm+4w93+yCEoaVq5J/7tlbeFIE+KcWtElMpJlEVPdTCMBdn
	 2r5vcZmNZXPMQ==
Date: Sun, 11 Feb 2024 16:54:59 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Udit Kumar <u-kumar1@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, chandru@ti.com,
	rishabh@ti.com, kamlesh@ti.com, vigneshr@ti.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] clk: keystone: sci-clk: Adding support for non
 contiguous clocks
Message-ID: <20240211155459.GA4443@francesco-nb>
References: <20240207091100.4001428-1-u-kumar1@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207091100.4001428-1-u-kumar1@ti.com>

On Wed, Feb 07, 2024 at 02:41:00PM +0530, Udit Kumar wrote:
> Most of clocks and their parents are defined in contiguous range,
> But in few cases, there is gap in clock numbers[0].
> Driver assumes clocks to be in contiguous range, and add their clock
> ids incrementally.
> 
> New firmware started returning error while calling get_freq and is_on
> API for non-available clock ids.
> 
> In this fix, driver checks and adds only valid clock ids.
> 
> Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
> 
> [0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
> Section Clocks for NAVSS0_CPTS_0 Device,
> clock id 12-15 not present.
> 
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>

no empty lines in between tags and only tags at the end of the commit
message, this [0] reference needs to be before or moved to a `Link:` tag,
whatever works best for you.

Francesco



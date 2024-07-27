Return-Path: <linux-clk+bounces-10069-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC493E0CF
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jul 2024 22:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E24B215EC
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jul 2024 20:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB9D187861;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHVQG0wN"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16202187853;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722110844; cv=none; b=b5fZIKxoi70e9MNfW1Rsg+C7gfXnjF/QvdSSGWu77B0DfHaCB738JRTK+++52hNEqrbWbUuep7W+gNZishcIkotgYofDQTHjXGxQ/ErWhxjpOnEnFfSiCTPnm/FsQZBNZ8cixGuiPFmPAgbAbQvQdUoW5JvlDKejigdbjNt+nZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722110844; c=relaxed/simple;
	bh=+jC2uhma02axyzLYshpAUvSZgHLF8jTorooNqhSTXgI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tZjSKrDXcMV7tnXBdgTbRcncArf6iA8lAekQjhQb81RDjTo4ibCxFT6L38XjFjDmgHtD11ReH5wr9e+2iyGHPVyJr4v2sw+hHTWPSdSw04ONH+qXQ2Q5geAqQp6GdrxdgabnxuCQGvZXRXWgor6dTigKc4cvfbDAguJYr3vXDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHVQG0wN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC5E5C4AF0B;
	Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722110844;
	bh=+jC2uhma02axyzLYshpAUvSZgHLF8jTorooNqhSTXgI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dHVQG0wNXIRJ364NO737KUio6vdAknneqQpxHNQbfDz7bZ3U36WxOIopXOd+DvZyL
	 0i5Np/b9G2SObYRzSmm7A3/uwoAAjvK7FbG1N0tytScSTEhvU3EL9wFZuDUe9WpvK3
	 0ivg+JcAPcgFkN27A4j/lYQtYCVL4tfUmLJYbrLZ2aVXynOazciNTZ4cfZVnIux947
	 PKV/10bfeHYodWq8jmejvLD5iY61o0I7/2XFFcwrF12P40yKEiFmWQrqIywCSbYfuf
	 bxs6Cz6Zgw20WBkS/U6Sh10ufxiQ26bt8gXSFnVRdthZy+ZuIbaffQaYrGs2E+LVif
	 IZQSvtAD7Jz0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD352C4333D;
	Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240726185715.3655728-1-sboyd@kernel.org>
References: <20240726185715.3655728-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240726185715.3655728-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: f99b3feb3b0e9fca2257c90fc8317be8ee44c19a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de5f4fbe7bd20a5c464c3b0101ee3b8486f40189
Message-Id: <172211084390.16614.7533613773911402239.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jul 2024 20:07:23 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 26 Jul 2024 11:57:14 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de5f4fbe7bd20a5c464c3b0101ee3b8486f40189

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


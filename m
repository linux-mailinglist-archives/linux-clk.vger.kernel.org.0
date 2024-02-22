Return-Path: <linux-clk+bounces-3985-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C814986033A
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 20:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1DA51F2553B
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 19:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFA36AF94;
	Thu, 22 Feb 2024 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjQ+j8cr"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF56AF86;
	Thu, 22 Feb 2024 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708631485; cv=none; b=k+slqZwNzaTjDet3a+uPR4aiDI/8+WBz8rZe7y/MFalpcezCYJQTAUmipWVhcX1zmQw1TGV7ecZZS1x1M+Jhcwsy9c/iOep5lPSDeeoYr+ExOEuuG2buW4DWXAmeSLSu3EPqCHldaUM6S9x3tsFjP/3/5ySwX3ZUgwov7vTria8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708631485; c=relaxed/simple;
	bh=SzwwYFuLR6ZQog8lwwldYZZygr7tXCbPVaY0n40RI1E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dEjlhOZmIVqdOwSRmr/dFOFe4tU5edLcejhxjsbIfEO+cf6T18HVOgH0gFaxlY/uNz+tWS9nY1ypqjlkIenBquKXJ8bLd7DSXTA/LgvTd5nHbpIkAeXrZvnXhAM5/5Uk60Ntmgl0SMMDiKKexVeGJvunUclxrddoa4OHAZ8Q/E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjQ+j8cr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B05AC433F1;
	Thu, 22 Feb 2024 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708631485;
	bh=SzwwYFuLR6ZQog8lwwldYZZygr7tXCbPVaY0n40RI1E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OjQ+j8crwhbOIvhblfbJZZYCvT1V29VU84N/6cVuw1eWP1qawTlnAzkeeLIOYTa3Y
	 ZXrrcGcN9RC/u69FizSgz5NFLnmpsCvdIMJK+HFzGgjlisOsupMXdXSzDgV+UzzEcz
	 QPKY6LXgUXoiewaivCyUEpD4WbHGlA2j3PfH5egDyckA+VUdLUXecyXoMp7zrPrdPn
	 4eCFQfwBhKdaiOfT/0iRwYP/2JyRzgGQ08GDNMTk2KIYh+cnnInkkfneVJasQJW06b
	 kGIGwgttZHFQgVYjB5M4q7NC4ovUNFfoggQATK5V4eg079+v9ueptCkqduBXr6X/RG
	 nCuTAjVtuWx6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 372F7C04E32;
	Thu, 22 Feb 2024 19:51:25 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.8-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240222064521.2538149-1-sboyd@kernel.org>
References: <20240222064521.2538149-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240222064521.2538149-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: cc976dbc492c2bf67d8225845b609ea72e292128
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88953761b94df7dc9bfc46591a8975401689b057
Message-Id: <170863148520.11658.7094787355205911363.pr-tracker-bot@kernel.org>
Date: Thu, 22 Feb 2024 19:51:25 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 21 Feb 2024 22:45:21 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88953761b94df7dc9bfc46591a8975401689b057

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


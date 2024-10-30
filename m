Return-Path: <linux-clk+bounces-14045-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A2C9B6E52
	for <lists+linux-clk@lfdr.de>; Wed, 30 Oct 2024 22:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B4D281C7E
	for <lists+linux-clk@lfdr.de>; Wed, 30 Oct 2024 21:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3482141B4;
	Wed, 30 Oct 2024 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcPLhnp5"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0EE2139A4;
	Wed, 30 Oct 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322139; cv=none; b=tvRAqNpReb3jXOQdhTfONEjc/bP+tlzpiivbMXpi04u+5gJrgTUe1MiiTceo9Z0rWdCxxGnsCePjudeuMjdtD9UlnmhlmrjFtURWN/Z8GXKSSJvzuTtLKepcjeflufAfyrCRoVBDPtJK3XuuXnL5UEKevR+fqekiApQkW5cDxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322139; c=relaxed/simple;
	bh=dV0CJUVYk+pJK8bM5R2R8JIpg8iSnCYQ7BBihu9uQzg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=SdHx//mYTe2uUOGRe3/WOTALp/sfTESA3JBbdpxdFUK/h4qBwN/cc/NWMI4Yrvcm60f0uFOi6KqTy55Gc5Ff9DEZLkIKIgEb95QVTPMo79U+ZZbdBrHoIK1U7auzzoKke23evuuHHaJCDldl8dyPM5chFOwVai1SMAuHdm3DkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcPLhnp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB83FC4CECE;
	Wed, 30 Oct 2024 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730322138;
	bh=dV0CJUVYk+pJK8bM5R2R8JIpg8iSnCYQ7BBihu9uQzg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=tcPLhnp5GzJZQ2VpKma7dkoBKrGxTJLc4urxLyX2ZX2D+mCJMmZ5A/5k/eY+Kjs23
	 +i3Ap3fcbmnmY5KdVDasrOjRZefl56qhuvJ0JHp2SSOucvfzDTpuLvwQhI/8Uo1FYg
	 rmzmL5HDTNHsAgB/jCDwSjju4+HqSuEQhAZU1TYuNyFIrKRK+1SRxbmSaCqjrwKHwC
	 5JL1tKZIYwWJ1zsu1x4LbTAagHgvaNFiZHNoowfDBa6tLhVjgPWPjhkEUK4kWaBfLP
	 iefzW0+e4peqz6SR7V8ullh4BlBJUY/5nPrnpV7U6Mu/DkorDlj/cCS6kLGltbgXjk
	 Og0oNm4t49KWg==
Message-ID: <9d9e16d140e50b9c16ae6d3f58de719a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
References: <20241028053018.2579200-1-ryan_chen@aspeedtech.com> <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
From: Stephen Boyd <sboyd@kernel.org>
To: andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, joel@jms.id.au, krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, ryan_chen@aspeedtech.com
Date: Wed, 30 Oct 2024 14:02:16 -0700
User-Agent: alot/0.10

One more thing. Please remove the period from the subject. No other
patch in this series has a period at the end.


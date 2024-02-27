Return-Path: <linux-clk+bounces-4183-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC286A1B0
	for <lists+linux-clk@lfdr.de>; Tue, 27 Feb 2024 22:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EAE1F2E322
	for <lists+linux-clk@lfdr.de>; Tue, 27 Feb 2024 21:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF830153BEB;
	Tue, 27 Feb 2024 21:28:21 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42414F9D4;
	Tue, 27 Feb 2024 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709069301; cv=none; b=bIQic2eJpq+scu6O//iNsJAC4xlrMAYpnrPPNB2PZoLDVV/70bQQUpH2ORa1UD87f8PJRbpYk0z1E1+wlcwOOjvPfPfky6iyHS9VpJgG8OYcNZ4mQZw2AcmDj94zph3dt+VW/2quFTdeL5rSrVMmRmC+/qcmU1vj74ji4g20NnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709069301; c=relaxed/simple;
	bh=Q4z6M3YcE/VFHljn4TjZ6phRk+ZDqjugl4BK6oRqISo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iy3Sxwt4ngrF/izKQcMrH0ZkxMTMn6UQYOJwqZfXvCtyINS+LAIMZk01bp1pvKthaNFTbROH9rqNWoO0ayu39Pm3hnZNitt3imvsRJmjSpHyqxMo5BTx1SnU6zRD5t7p4p1HvhjSHKrNTW8MhSHcdLmsUfLZ7hEIdy1kY4KVLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rf4zg-0001JV-J8; Tue, 27 Feb 2024 22:28:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/7] rockchip: clk: improve GATE_LINK support
Date: Tue, 27 Feb 2024 22:28:06 +0100
Message-Id: <170906921352.760270.17022081132871097984.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 26 Jan 2024 19:18:21 +0100, Sebastian Reichel wrote:
> This is a follow-up for Elaine's series. These patches are written from
> scratch, though. There are two parts:
> 
> part 1:
> Elaine's series used to contain patches for the VO1GRF handling, but they were
> dropped at some point because of the CLK_NR_CLKS feedback from the DT
> maintainers. I added some code, that should hopefully fix everyones concerns by
> figuring out the right number at runtime. I also moved the correct handling of
> pclk_vo0grf/pclk_vo1grf before proper handling of GATE_LINK clocks, so that it
> can be merged ASAP. These patches are needed for HDMI RX/TX support on RK3588.
> 
> [...]

Applied, thanks!

[4/7] clk: rockchip: rk3588: fix pclk_vo0grf and pclk_vo1grf
      commit: 326be62eaf2e89767b7b9223f88eaf3c041b98d2
[5/7] clk: rockchip: rk3588: fix indent
      commit: 2a6e4710672242281347103b64e01693aa823a29
[6/7] clk: rockchip: rk3588: use linked clock ID for GATE_LINK
      commit: dae3e57000fb2d6f491e3ee2956f5918326d6b72

2nd part of the very easy and obvious clock patches that make
sense on their own already.

Now I just need to look at the final piece of the puzzle :-) .


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


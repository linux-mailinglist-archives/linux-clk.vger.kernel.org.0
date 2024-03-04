Return-Path: <linux-clk+bounces-4360-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551486FE62
	for <lists+linux-clk@lfdr.de>; Mon,  4 Mar 2024 11:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5AEF281246
	for <lists+linux-clk@lfdr.de>; Mon,  4 Mar 2024 10:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317C12374B;
	Mon,  4 Mar 2024 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFQED+jr"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE196224ED;
	Mon,  4 Mar 2024 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709546821; cv=none; b=EkN7s19mh9XLBdFfiOFGePWKetK3wq2QagPv3g/y4x+ZmdNmVqn8gfyoyxuxCUlF+swBO6vYS3Vo2mmsCve9SjHCv5LM2I6T9kxT9CtXh/5NWmcHX/Jt+AZUE/telr6TEY+o/Mm84jbRZyG45dJal1QvkHTuxEXp1+XrQioPt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709546821; c=relaxed/simple;
	bh=zb/zWbcIFlXjIUKTmNwLYZYzIs7lgmlr0WsOLv3bGM4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=lGqSz9rEaKIhLlbJ13m+4tF40zsiyr87YkC0/HNV3sY4O2lgGyqVP9h/tBmf67SB5Gi51ZuePjYkFFGjr2wlKDiUAQgrmnQyOSQaZzc9WN3/TNJtX5HLNyGT0pSK7moDnjH7gB+eH4OJa0ihoIi89JqHCSNvrI11k5f33m6EQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFQED+jr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E30C433C7;
	Mon,  4 Mar 2024 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709546820;
	bh=zb/zWbcIFlXjIUKTmNwLYZYzIs7lgmlr0WsOLv3bGM4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=vFQED+jrVivsCkVNX9kKYt7DPzzYt/Rk9c9km9Aznn2wrlkew3cUY9oHHRJ8z/S6O
	 /pws0eG1f8CMlrDEypWbmgb7MhhxFrXHL86F4X4b+tknwqSXk7NBYuOLQABnbcAafL
	 E6NIW4q854fOKV5k10yCljLg/5TnxPc7dtA0QGPbNlHpE2081JRIY3VdWv0y4hN5f0
	 Uf6DtbXU7gvYE2Bofpnj9vErgbzvdngC3bzCF992nXl1CDkLLE2B5iZXBB/EqIFEEn
	 hMBtXyOmhTxLrnPB4qGPuR3iSdQ7SiBkeAxaCk0FOLFqZ2HeD9qMdUA1qz9/8xRvRc
	 /GEa7kMKTaxhw==
Message-ID: <b29f024c2ab6d532dcd5143dc302b8ce@kernel.org>
Date: Mon, 04 Mar 2024 10:06:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 2/5] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
In-Reply-To: <20240304-pinephone-pll-fixes-v3-2-94ab828f269a@oltmanns.dev>
References: <20240304-pinephone-pll-fixes-v3-2-94ab828f269a@oltmanns.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, stable@vger.kernel.org, "Chen-Yu
 Tsai" <wens@csie.org>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Diego Roversi" <diegor@tiscali.it>,
 =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Ondrej
 Jirman" <megi@xff.cz>, "Purism Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh+dt@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Mon, 4 Mar 2024 08:29:18 +0100, Frank Oltmanns wrote:
> When the Allwinner A64's TCON0 searches the ideal rate for the connected
> panel, it may happen that it requests a rate from its parent PLL-MIPI
> which PLL-MIPI does not support.
> 
> This happens for example on the Olimex TERES-I laptop where TCON0
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


Return-Path: <linux-clk+bounces-5795-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA58A09C8
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 09:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A26FB259F1
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DAD13E043;
	Thu, 11 Apr 2024 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrPLoCv9"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE813E038;
	Thu, 11 Apr 2024 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820555; cv=none; b=Vs8O1fTmDnI2eUg60FdTVLQeYp4nh3aDl1/PbCldsEB9WD8yIyeerBkXQ7CNU2S4K8pMxS0yEuHXihUWGnVkTbGvJSQsX8xYtjmhABLZ6kNFoEeSuaMSpK9/erbDHsjDdhDdId+SAoSdx7Gd4QnT9rGjesl09R/gmYVgUnz7X6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820555; c=relaxed/simple;
	bh=XNHCk0cjghJAwMpoQxUfx7JrTQGFHEAEYDprQEZGj74=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NIEmTB2yS+4Iq11/r50GNptNiY+CkHni0zGyEwnsX0hdmsc+hWLJEuejijtcNZsQRDG4GK73tfv4skslBP141JF9Gsi+MtG5cKrfMtaVHdY8I6dg0PT/0JeWpX5RYs5//sLgj2rAr/gn2C0xfTuBnAltJLyU+wIkJmk0lukaMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrPLoCv9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F31CC433F1;
	Thu, 11 Apr 2024 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820555;
	bh=XNHCk0cjghJAwMpoQxUfx7JrTQGFHEAEYDprQEZGj74=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NrPLoCv9C99Ao2PC5CAZbxXN4GmE91ZSx2cOSVg0lyselrhS8HlHr94vJRatZqRgv
	 ub4Og67C9Qc6+BlGajIrpehqt316VENdVYawMg+RfSh7S8wKcZ5XuItvkC7aJUc79Q
	 3E4F9C/C9kKf6Scl6yBF4NEHxUnT4YCJapAqC32z+9nFtHhPvnddD/mHLFh0dZ6nvU
	 bPdMNaeHpDSKHKWdcRum966iBEDG1MtAk8jz9bsbjK4BHPkIH2IiYOi4eqqhBlx1uD
	 xB2U2CSYIF4iZ+/tU8Hew5cShBN5Z/GiMwf/sz91cWh8AIXI/oTC3dmpoKQjeMBy++
	 yB2KJa9fmxlmA==
Message-ID: <b7e1db53f9a5541821a9345aaaf5a277.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c4784102d2bb8bf6982799babe39d5827235461d.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <c4784102d2bb8bf6982799babe39d5827235461d.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: loongson2: Add Loongson-2K0500 compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:29:13 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:08)
> Add the devicetree compatible for Loongson-2K0500 clocks.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next


Return-Path: <linux-clk+bounces-21474-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AECAACF67
	for <lists+linux-clk@lfdr.de>; Tue,  6 May 2025 23:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BBEA981232
	for <lists+linux-clk@lfdr.de>; Tue,  6 May 2025 21:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25644217679;
	Tue,  6 May 2025 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lf5pmecR"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C1216E2A;
	Tue,  6 May 2025 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746566110; cv=none; b=JAZRIyzhkQGw64BE2pRTQzTIh7eAw8Pc3Cjh96T+Y06hNYK0cBoHvkD5X0iJrk03krCuB2Ouw3S9dRtzmrui6GMVPSl/7NNbSggio/9twxwhJo3Q12AK4kKvDEzfcrC8umcP3joEj7WAHSYnO3lBYhkP7zy/XXDRxN34JCOcDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746566110; c=relaxed/simple;
	bh=UKDHa0bNqRGou8tssWC4DP+HvyHvliqv34GyV/Vyj6Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=FDYd1hlY/lt4zmFKvteLzOjT0Pd33v3PkwAKeVSKTF5CCadLhFT+a9I66IACfe0dTdHiyNXpqa4mVBBcYzaxHB25ycazGUSphG+iQselX6alX+DYaJGg8q4ty0KHDyMJ/WgHETEI3ZFY64IASB+gQR28tBpCJiXkPcl/BXqOZ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lf5pmecR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F4CC4CEE4;
	Tue,  6 May 2025 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746566109;
	bh=UKDHa0bNqRGou8tssWC4DP+HvyHvliqv34GyV/Vyj6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lf5pmecR/+hvX5yBph9kRNqb/T/VN8CvscGLViGx20XpFvd204wWNIweCzGnFEs7f
	 gbZ6Zh6B+ppM9NxyAehlXoYUbgdwThSzR33NLcZ6BEjaucB+2pvrXKSzvJFXYMFmW4
	 M8RUbVPcZ2tUXBVtJpZTo7gglW50EsQemQ3SbHEe1dB/tR0tI3mdx/NpqykILiREKI
	 D9n4KPuaBOav/Z4u7kt0SUA1UGz+x+RSFWeiqJSnHklfESqK1prvR9cmjN0A/YgErX
	 Qcio5j9h/damgAm/3SD0UtpCcDyYgN7R9jVnalDF46wyj7JHPEYMM+PDKGR9u8mJjk
	 zC8IdijU1AcLg==
Message-ID: <673e96e58a1f5043c7a073b8f971d29c@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>
References: <20250505161933.1432791-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Tue, 06 May 2025 14:15:07 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Rob Herring (Arm) (2025-05-05 09:19:32)
> The binding is already covered by st,stm32-rcc.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next


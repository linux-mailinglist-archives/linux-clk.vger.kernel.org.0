Return-Path: <linux-clk+bounces-27884-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF0B586C5
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 23:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99191B24D2B
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 21:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50892C028E;
	Mon, 15 Sep 2025 21:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wb5kIjFc"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733732DC78E;
	Mon, 15 Sep 2025 21:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757971724; cv=none; b=Y3819E9Mj7Wy4rq/QWNoabxk0lSDXzM8K+ka/uvOWhFfDI3E8s7L3H48NBPH4arzHjE+CGdL3uQQfqXBpz1Cy2Dvk61hbI35lybLUZKIWN4QRmtMvRG0/eAfJAlkDbk397tjSE2sV8a5oahQnPnGRkao5p1+o0LK0iDh534pfMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757971724; c=relaxed/simple;
	bh=J7w5Uv588seucAZc5qK6ZM10e3QMlvHhql5IgBepXTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILNWQDUtoi+KG5+DS0qihL5DXCC4ChKQLLbEyRrff+og3lA528OZtDlL4uJa50gvdQ8CdZ2OQRNNEPFjn1QyKuXbA1UvJ1ue8L12oJIXgbwqT0LFz9e7gW3IypQGJCamJwRDO6M9Ok8d3yjqraD2bvetaMfR9030le4OxaqQUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wb5kIjFc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42DCC4CEF1;
	Mon, 15 Sep 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757971724;
	bh=J7w5Uv588seucAZc5qK6ZM10e3QMlvHhql5IgBepXTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wb5kIjFcTfPKvpc15/hdnRAwaV/ZVHS3ezGLGY27czT0B1oOghzLiddhMedOllcwK
	 rOomRU56t3LbDhVWi70Ni1/Sc9OCFayutU1bZHcIa5EkxqJ44X+WRLD7oewFuZlMbN
	 lDIs3IVw3S3ztGBiiMKcvkQxEQX77QFI90PGPE9yVYmTU79mEntjai9sCo+nSFFdmI
	 XExePHm6sTfjB0W+uSN8uiaQs+xW73LIxS/F/ceGkwsrDvahUmBKFRnmy6jejOyoPM
	 9SW1T7m7QG6sFYN5XYChvY30gDUiRKJsEHrZxMlYbIuSoYoiOI7TcN2erOS46dZqxj
	 ZuBIa2oo+fKhw==
Date: Mon, 15 Sep 2025 16:28:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove
 deprecated compatibles
Message-ID: <175797172248.3553148.3537450919982755696.robh@kernel.org>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-master-v2-5-2c0b1b891c20@gmail.com>


On Fri, 12 Sep 2025 13:36:12 +0200, Raphael Gallais-Pou wrote:
> st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
> ("clk: st: flexgen: remove unused compatible").  This file has three
> compatibles which are now dangling.  Remove them from documentation.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



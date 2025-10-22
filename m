Return-Path: <linux-clk+bounces-29650-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F2BFC69F
	for <lists+linux-clk@lfdr.de>; Wed, 22 Oct 2025 16:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 435AA4FCFCD
	for <lists+linux-clk@lfdr.de>; Wed, 22 Oct 2025 14:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F7534B674;
	Wed, 22 Oct 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ar1UucqO"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391534B42B
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142348; cv=none; b=bQJEcyCxMlsajVclsNQ5o+Bz4P0sPs2PCx0BEKOFalExupTEhdcMa65Y7ERBJdqN5pUX623F0FHJ4UlR75jQ+KVR3LljjFbre19bR9xgtlc5w0SZExQdziymZ1oZwCHHLsSwqAOQqVNjP+hm9gjOo1sOXvsmDlqQiX978nVUzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142348; c=relaxed/simple;
	bh=2tD9Dd2I5mfKt/jOPREylpMxst4xlujfA1H39bh/pAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eKA4UV8f3UPTcQ2cvCAJ88izh10w+5gB0WncZyajqYKcviJllSy6Fw99KQIw//72ABcZeCFiAwlVHSdTBEN3uoG1B2sG+I6izvnA5zNdSmCh+CpKfucnWYlS3ah/v3DKNF/8vymSYUB3PfnzVfhiZbqJCUjS43Nfci06loxyqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ar1UucqO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 59D2D1A15D4;
	Wed, 22 Oct 2025 14:12:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32FEA606DC;
	Wed, 22 Oct 2025 14:12:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47A7F102F2432;
	Wed, 22 Oct 2025 16:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761142343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2tD9Dd2I5mfKt/jOPREylpMxst4xlujfA1H39bh/pAM=;
	b=Ar1UucqO2ytR2avAw0DsbeqP3tjYfW3tcBpwoXfy+A3o1GpC+BboZjWTzKIB9dj7pyfFhB
	bOuASXrnWebu4BAkXx2CScZDu/F8i9goSPLq85Etsdt/w+GCiU4nqyCRfOF3lPzjlnYNEt
	2iIg0MdKTdXIfDYT3yiXuVizvajwDjIsHaDjfPxlgdeMIxZEt/bB1ohsXRIo26jyGl/c3Y
	3/FlAEQXutzLAgzytk4ezgNzuBM7laNYWaUUWRipBS7Fch4jdtp/m07SkErQQKVEH/s1R/
	xDANDM7g0/4y6j52X/SEhc7JeS3vBcWYN4mX4rIriWgh0l9YCcPP4tHtfm9IHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell AP80x System
 Controller to DT schema
In-Reply-To: <20251014153040.3783896-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 14 Oct 2025 10:30:38 -0500")
References: <20251014153040.3783896-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 16:12:21 +0200
Message-ID: <87frbbrpoa.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

On 14/10/2025 at 10:30:38 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell AP80x System Controller binding to DT schema format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l


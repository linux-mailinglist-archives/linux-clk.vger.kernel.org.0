Return-Path: <linux-clk+bounces-5769-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A948A08A4
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 08:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445671F215E5
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 06:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7A213D622;
	Thu, 11 Apr 2024 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSQQvraj"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC97613CA9C;
	Thu, 11 Apr 2024 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817764; cv=none; b=CAvnsRI9sCIxcXeIS7LPjcL+w5V2zXekm1JdM+ErCYRFpag1z4ET7YxCygypMhp/IJGWWEfYOv0OSevIN2SJne2u2mjku5nVEgQdPGXFYBCW+nwawhqhPo5QKsSGgWuwx3tDV5k76ZbfmWU38ZiX6OdKftHzMFOb0t7Q589jNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817764; c=relaxed/simple;
	bh=oY5a4Ot17m0sMgy4zMzuvkfZSw4jNJxJmnt6iW20b3Y=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=G+Ta4rMkHbC0nZE8YjDTlUXs/JkMWk+JloiyJ8sbKy6jBu/94SoL/jCqQHpObArtnKyT0MmyYRu5VU1EzkVZsR/w60IzB2rE18Fu31ftoOuI/8fcEjJR/Gj6rSghD++JCxXAI4LZhODFNY6GfFuZOZOkbN3qdNlKJYfr0DK2RmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSQQvraj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0053C433C7;
	Thu, 11 Apr 2024 06:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712817763;
	bh=oY5a4Ot17m0sMgy4zMzuvkfZSw4jNJxJmnt6iW20b3Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XSQQvraj84k7Lzc+gp3QcKgEXUMRxUhpWcMPwOPxZeXodWv/OqsQ7vDrN27GBxGPQ
	 JNeHMygM57BQoSpSGZaV5WzkXsWfkO/a2d6pTTEzypAsv9rgVtvZ5ubBaZh7g4gdAg
	 rOf56enkN/Dv3ygcQksmk5XdQno4jPY5lSOao6QY1Lev8mIdZ2BZPjo/y7FzNDYfCL
	 UKNWLTYGNSkqnZTMiYEOsvCDbRGBCZ1LWyx4P+xVMrrs1B0YFDP9/qmFH5IZlB3RGv
	 +DPn/hmrcs3uW9SxE+Tlp5GHbDuoTVEUyPviSr9A6TbDZ3Z4ZDxjN9CcDESVn9gHgM
	 9PYOiCVRrKN+w==
Message-ID: <44e544735066391b2ad1682badae4462.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240123025613.3976-1-zhifeng.tang@unisoc.com>
References: <20240123025613.3976-1-zhifeng.tang@unisoc.com>
Subject: Re: [PATCH V4 0/3] Add reset controller driver for ums512
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zhifeng Tang <zhifeng.tang23@gmail.com>, Wenming Wu <wenming.wu@unisoc.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Zhifeng Tang <zhifeng.tang@unisoc.com>
Date: Wed, 10 Apr 2024 23:42:41 -0700
User-Agent: alot/0.10

Quoting Zhifeng Tang (2024-01-22 18:56:10)
> From: "zhifeng.tang" <zhifeng.tang@unisoc.com>
>=20
> In most of Sprd SOCs,The clock controller register block also
> contains reset bits for some of these peripherals,so reset
> controller and clock provider are combined together as a block,
> and put it under the driver/clk/.
>=20
> Changes in v4:
>   - Add description why reset controller put it under the driver/clk/

Please use an auxiliary device and put the code almost entirely under
drivers/reset/. You can still have the data tables in the clk driver if
you want, but I don't see why an auxiliary device can't be used.


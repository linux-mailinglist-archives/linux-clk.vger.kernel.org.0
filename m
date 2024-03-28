Return-Path: <linux-clk+bounces-4470-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E02876E75
	for <lists+linux-clk@lfdr.de>; Sat,  9 Mar 2024 02:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C98E1C20BA7
	for <lists+linux-clk@lfdr.de>; Sat,  9 Mar 2024 01:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBD6101C8;
	Sat,  9 Mar 2024 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSfoDCHK"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A417CB;
	Sat,  9 Mar 2024 01:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709946940; cv=none; b=Th5QflzCu6bWr0iDEl3NvnI7hDBadACe+roctJim41Gr3+68RwYZRtip8PeoH945A0U/+yDvlSHXwOFa60sed3sFFDOwSRb6EbsJ7yduSjP9ven6ELRX6lfoZi+UMeDHPKQ7EtXWXedVtmddNKj4j6ITxdbKvmwZrS9XP2jyMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709946940; c=relaxed/simple;
	bh=6FpOtmp2kBz26b298jFdBcFB423gt4wI31rfYPbCUpw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qDyy4cZdWBjYxmELIrnyu7W4Oc8+nhsBsrGMth+HkCeHSxY8OsoJjy9TEIpozlE9x90Sj41/JfILOhhoQ5GU6Jk1V8Cf84rtGOr+4+O/FTfxG/sjxlf7zBbegkOqEnCynL++17h6RTuWlMwNrWugYu+mvpkOEUwV8P+NlIiRlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSfoDCHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6D0C43390;
	Sat,  9 Mar 2024 01:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709946939;
	bh=6FpOtmp2kBz26b298jFdBcFB423gt4wI31rfYPbCUpw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iSfoDCHKj9458BMTQrj+BKQCp6obRV93LKX/x/kR3vJMgahQaih8BLzvCcnbYGDyF
	 7AO3ywHmlSX7OAWnUCbFjWqqWK0Bue8L8PMvlcBGk73+NJr2OT7LlUDPtCA4btCEQz
	 8K7G3cjdGQDF4p3A2GbcMMgFYq0Ik0VrwGDUaZztWhXCu+iJN3CFY4766XSxlnEPkw
	 VBSzpyM0kciwmpZq9B525gZHRJrF+EQed2MAyprnW1zCf9Z0yKDog1IC0sMpm9OYV7
	 +UoCdyNE1C1tHP91mLgdeGpsuPEl9iJJfXKNsmYFjEn4Z0WubdAW2qxVBXIosRSeVx
	 u0S9To04HfRBg==
Message-ID: <0fa3332abcf4593376795f52ea145722.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240301084437.16084-1-duoming@zju.edu.cn>
References: <20240301084437.16084-1-duoming@zju.edu.cn>
Subject: Re: [PATCH v4] clk: zynq: Prevent null pointer dereference caused by kmalloc failure
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, michal.simek@amd.com, Duoming Zhou <duoming@zju.edu.cn>
To: Duoming Zhou <duoming@zju.edu.cn>, linux-kernel@vger.kernel.org
Date: Fri, 08 Mar 2024 17:15:37 -0800
User-Agent: alot/0.10

Quoting Duoming Zhou (2024-03-01 00:44:37)
> The kmalloc() in zynq_clk_setup() will return null if the
> physical memory has run out. As a result, if we use snprintf()
> to write data to the null address, the null pointer dereference
> bug will happen.
>=20
> This patch uses a stack variable to replace the kmalloc().
>=20
> Fixes: 0ee52b157b8e ("clk: zynq: Add clock controller driver")
> Suggested-by: Michal Simek <michal.simek@amd.com>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---

Applied to clk-next


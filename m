Return-Path: <linux-clk+bounces-5606-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 745ED89B611
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 04:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8D02B20D04
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 02:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DF317C2;
	Mon,  8 Apr 2024 02:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqUV259x"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD237B;
	Mon,  8 Apr 2024 02:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712543972; cv=none; b=Hfp5kVHUfPzBHXuOQ2p+JVYx+HXdjUaQLEU7G6XozrByWqlJsv5z4mRdVf0SN5B081iW7+4MHuAHse+3kp0rCrYWucUrjLkFSF7Q5louvsAZrfpfGfedH7aadaA8rqLKOp9nm88EL+NijoxdgvcVkByHWlzqaICMZgIojGLMN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712543972; c=relaxed/simple;
	bh=WiV1uZ4O5oZWV8uovYZMAUBP4HUdX6mv+zU4qJDlZYg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NcmXUttJFANaatw7Gj5dgoO2ewPkozRdU510edY1WDAMi2q4e0BVlgyE+YUXentbkzkhTwqwui4i/kr7XD/clOFOf+kI45q+6N7j4unGilD6XB5meR9h9ujSEA1WXiJ+wGMtmzPCMbivyZGp0ag+LYiPmUTQ8I5aMMDnXwflZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqUV259x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A329C433C7;
	Mon,  8 Apr 2024 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712543972;
	bh=WiV1uZ4O5oZWV8uovYZMAUBP4HUdX6mv+zU4qJDlZYg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sqUV259xrrRSDDv2FEoC8m5pPA8WfITE82/FYzxSYFNJ22TTpgk+XFvCk2G9GWiGJ
	 mh3XIJN0rXm+ipKR9nKjUIKStbuIqnONgdlV13Ezyv+vFY0983Tj6b27Eka0BICoy3
	 ojwB1b+5EJwWbx7uWMcGCcYgaLy/QEK2m3R97xzxhyV8FdKRnTfXPWdxtKSa6eDOEM
	 y+oHMDOHE5nJv/Wv3y/4hCx+kuGPZ6MlocIlTUN1L+d491n3e+Cg7gemxhBa5wogjy
	 5SXG649had+fGF/8tSK06CaasyXBD/gBaKEfsrXd0G10/KDxs/vHJ9yyuYk8sgwP1e
	 vqg0Y/AuLp3aw==
Message-ID: <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com> <20240328010831.884487-2-jan.dakinevich@salutedevices.com> <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code to separate module
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Sun, 07 Apr 2024 19:39:30 -0700
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-04-02 07:52:38)
>=20
> On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@salutedevices=
.com> wrote:
>=20
> > This code will by reused by A1 SoC.
>=20
> Could expand a bit please ?
>=20
> >
> > Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>=20
> In general, I like the idea.
>=20
> We do have a couple a reset registers lost in middle of clocks and this
> change makes it possible to re-use the code instead duplicating it.
>=20
> The exported function would be used by audio clock controllers, but the
> module created would be purely about reset.
>=20
> One may wonder how it ended up in the clock tree, especially since the
> kernel as a reset tree too.
>=20
> I'm not sure if this should move to the reset framework or if it would
> be an unnecessary churn. Stephen, Philipp, do you have an opinion on
> this ?
>=20

I'd prefer it be made into an auxiliary device and the driver put in
drivers/reset/ so we can keep reset code in the reset directory. The
auxiliary device creation function can also be in the drivers/reset/
directory so that the clk driver calls some function to create and
register the device.


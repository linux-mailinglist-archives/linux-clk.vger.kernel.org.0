Return-Path: <linux-clk+bounces-1865-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F130C81CD20
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 17:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F5D1F217BA
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 16:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C093728DB3;
	Fri, 22 Dec 2023 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="h2jY+MEX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C228DA5;
	Fri, 22 Dec 2023 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703262801; x=1703867601; i=markus.elfring@web.de;
	bh=II1Syu+QZpTTdKNVAA8lEUdquR1iIiAORrysqoovEIw=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=h2jY+MEXYpMVABxYGUvm996cPhhIram0PivmZeM9XTQuG1paepFqqv531VIYPkpF
	 tKIonNpSLhGLswkvBs2/2Jfd6y2DdNTW4gK0RG1QFmHRld5P/Rk1MkDwODqym3RWx
	 IwI/rG+lm+qKVmKyTyNDna6fTCbwbkwBrip9lO8rMrZWn3qB/k/H6S90/CzxLZ3Ng
	 pqPRduHHj+0eNa6O2ZqK5rEDK7BPUE9H+J0v88mDOZGYUuRoFcI7k1gnCZulICGNd
	 eESfxaOrbbpt6/K9mU0mFSeK05AK9wR8qjhl5R6Zt8sn6Laz8K/JzD/njgVJ5BvMh
	 NAdi+ouDfXEga2lRHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Vsx-1rBvG53VZJ-014Irv; Fri, 22
 Dec 2023 17:33:20 +0100
Message-ID: <1d494176-2238-4430-bc26-4e4c78fe4ede@web.de>
Date: Fri, 22 Dec 2023 17:33:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, kernel@pengutronix.de, linux-imx@nxp.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] clk: imx: composite-8m: Adjustments for
 __imx8m_clk_hw_composite()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W6dljh25Z3qX0ewVj1QQEwoJbI1MVRnyEOTGeRUMxGzbQwCIVg8
 Jpn+2Q85+M+DNp1/ozepjDmvieNaTOwDo9oEd9yJ46ddZ0GoKKWUYkA9fT0nniXAPnb1bTN
 Q/syistUvudxN9oH4763xgTR5TTE0+xZsBzzcruzYhNG5JMpCqdIdkTmpWw1ZHJonWN5o6D
 Mgqr6UohTu9mC9LNFY6ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FqRND/JLYg4=;EfoGxG+5SJAxzghPY0IrN5E4rez
 B3m9cjA6AaMtZsXqG+7gh2LC4fM4ug0OpwJsissxr6ftApZKl3WaiqAIbqpCDb5+DImS5juaC
 1pMfTjZMfU2rU99L1aky4ZCjGXyKg9j5les2Psg4RGYvWaGm0migpIzCMPov67m2Au+6NDb1C
 MsJ51mOaCwTzmppJxK4+scgBGbAlEM1WB7q0BvTWpXT6W4VjMnfI3CgOBW0g50551HUIBCNrG
 qNr7wjKrJgs1xu7vfvQJ7hWpo1TyFY1Rdx+PaX6qT3EJGgFhwbbrzK+ZBrmeP2+CWBC2PmVT1
 1PCvXyMaaAkSmVk0SO2oruZJTNZUVVg2cmznukUwQYQQmr0el/+6KlDUu1wBNqqnvVf1Lj0wX
 Y8E4x9/xNKDmQ86RRjPx0RGcEgvKSxPcre5ADhkZlN8MSb2KwMJdT/Tcdo7/79PldRP77RtXt
 9Gch/59opWQOq6SA36pdjAXzj/iic+22cj36g3VAnnKfC+/e5BAfaJBHemdtCS10tJmw6vpMT
 X8+poAovKjR7jrdJpoyIuqpmsKJ610WTIjWa38UVi1rrcgYmMNgVq/8mlnnec6cyxTin6mF/O
 eCddRYVgZOuYqZYJzkY7osI8F1OU9DvLQGRGe7B9unqIfphEJqf6IEXl9L8yZITy/Uu2S1L8W
 MbTJFHVC837bDVFjr8dtn7iGztI3h+Ppvjm1YuBDkMmt2+Rbrrv8Jx1djjwaW4N+gmX2feBMg
 6xgv5oKNUc9HVPhHJ3xjG7a2bL5kgzMkDV4Ysxjn0SuX9+kBU4Vbxzx/lBcDflrji/CvOdr4N
 LDB5uZtdLsp/MYBOjA3441rWR5gQyrLl7HEBmxCCIPoihmO4uewdDsPCUyff5QVgfFFSinn44
 d2RX/4LLUP/qti3HmY1bihp7wKt/cksc+VhsqAK/YPMI39y3GjFxLTzasuXOjkveSOyh40CG9
 ULA0Apt+kDuvXq5h+P8suLoutmI=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Dec 2023 17:24:32 +0100

A few update suggestions were taken into account
from source code analysis.

Markus Elfring (2):
  Less function calls after error detection
  Delete two unnecessary initialisations

 drivers/clk/imx/clk-composite-8m.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

=2D-
2.43.0



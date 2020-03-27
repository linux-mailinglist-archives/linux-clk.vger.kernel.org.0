Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0AF1950F5
	for <lists+linux-clk@lfdr.de>; Fri, 27 Mar 2020 07:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgC0GQl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Mar 2020 02:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgC0GQk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Mar 2020 02:16:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C12D206E6;
        Fri, 27 Mar 2020 06:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585289800;
        bh=EQr83JWSBv6qrRnaDVc1g+6yUSfEfLW3jrCAgc9qu/E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gZ1o2O886u06hI24Bjx7LwiOcO2y2fDWKnO50ZSSPPDuWS5iQuSph+OIlO8S6KAfT
         +uovvR9f5MvWKFVT/CddBOoUN6LWaMqAo3YUx2TGTerSZZYv4cyeAds3Erb30X+tv3
         mBflNXYa9o5Xqr75n35oRmolrEnIa1Y20ZYt+r1g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200326171933.13394-2-festevam@gmail.com>
References: <20200326171933.13394-1-festevam@gmail.com> <20200326171933.13394-2-festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: imx8mm-clock: Fix the file path
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Date:   Thu, 26 Mar 2020 23:16:39 -0700
Message-ID: <158528979960.125146.197956427405057469@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2020-03-26 10:19:33)
> Currently the following warning is seen with 'make dt_binding_check':
>=20
> Documentation/devicetree/bindings/clock/imx8mm-clock.yaml: $id: relative =
path/filename doesn't match actual path or filename
>=20
> Fix it by removing the "bindings" directory from the file path.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Applied to clk-next

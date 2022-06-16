Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C152554D5E3
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jun 2022 02:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244761AbiFPAPe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jun 2022 20:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350374AbiFPAOf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 20:14:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F034B8A;
        Wed, 15 Jun 2022 17:14:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7091061A60;
        Thu, 16 Jun 2022 00:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7CDC3411A;
        Thu, 16 Jun 2022 00:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655338470;
        bh=esxWYZlmQhdH3UEuDHTLCzWsFz2Uy80vJoG1CuwO9K0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CDpMupSyXLAC5cM7I1huEjCW9V/v344pPLtwW8ROL0nvJmaBnzNGxce8yi8XxcJjb
         SXwZK/S8g3jCbblOztQZxGdwQqpQ2PaEed1uAD+YfSUY2TVzaDiZhy4bGetvGS2Yho
         7Oc1ZxE/px4iN3fEnpFeeooeHkNEkc31ZjRYVoIVK5KoVastv8pRWejkswn+FA/hPS
         YCDAOWnKjysYP32Mp3tQ8OR05XkQUzOCETahlmBhRT1ova4CP8qeiJ+/LuGuyJZfeK
         +Koes5dBODW9wH9KDUKtQmqbBqKt77oookeVR2aL/PDtLaJU+6/3cy1Ts2nl7swK+e
         lXdtKIMQy4Shg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c9a04a45-d2df-5596-571e-08502fbb3709@denx.de>
References: <20220517235919.200375-1-marex@denx.de> <20220615201027.DFCC3C3411A@smtp.kernel.org> <edbfccf3-0723-b570-1315-a0951b530a66@denx.de> <20220615222210.3D7F6C3411A@smtp.kernel.org> <c9a04a45-d2df-5596-571e-08502fbb3709@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 17:14:28 -0700
User-Agent: alot/0.10
Message-Id: <20220616001430.BF7CDC3411A@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-06-15 16:42:25)
> On 6/16/22 00:22, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-06-15 14:55:17)
> >>
> >> It means those clock must not be turned off, but there is no consumer
> >> described in DT.
> >=20
> > So it means "always on".
> >=20
> >>
> >>> Instead I'd prefer "always-on-clocks" here, so we can indicate that
> >>> these clks should always be on. It would also parallel the property in
> >>> the regulator framework.
> >>
> >> This property name is derived from protected-clock which you introduce=
d.
> >> I think it would be better to stay consistent within the clock framewo=
rk
> >> property names ?
> >=20
> > protected-clocks is based on assigned-clocks. There isn't a
> > CLK_IS_PROTECTED flag. I'm not following your argument at all here,
> > sorry.
>=20
> critical-clock property name is based on protected-clock property name.

Got that.

>=20
> There is also no CLK_IS_ALWAYS_ON flag , but there is CLK_IS_CRITICAL=20
> flag . Sure, there is no CLK_IS_PROTECTED flag because the protected=20
> clock is implemented only by a single driver (qualcomm).

Alright, thanks for clarifying the argument.

>=20
> I think it makes sense to align the DT property name and the flag name,=20
> and the critical-clock is aligned with both other DT property names in=20
> the clock framework and the flag name.

No, it does not make sense to align the CLK_IS_CRITICAL flag with the DT
property name. The property should be named what it is, i.e. always on.
The internal clk framework details could be changed at any time whereas
the DT binding is essentially forever. I agree using a similar name may
help connect the code and the DT, but that is nowhere near as important
as choosing a name that expresses what is happening in a binding that we
need to maintain for the foreseeable future.

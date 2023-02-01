Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C39686D93
	for <lists+linux-clk@lfdr.de>; Wed,  1 Feb 2023 19:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjBASEm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Feb 2023 13:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjBASEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 13:04:41 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD525B58E;
        Wed,  1 Feb 2023 10:04:39 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 20448CC3DE;
        Wed,  1 Feb 2023 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1675274678; bh=UeHSEREc8p7jIiPE+MKJj2ZLuJH5lXrVt4NUwIbJxBw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oQZWkVTkECkrdiAEE6+Yr/NRWt7VPHAp8KARyQRDBoEvlwhxEutzFL5uomOcQBL6R
         kNMsp03VyRFLkPELSKvMzxHNMxHyTSsEHjK9HFhMJNbQs4gW4tYpEPfcxT38W/utIK
         +oXvI6Ou8rl8/NApgxBTQiNviBwCL1G8ehHn5Rbk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, mka@chromium.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org, quic_kriskura@quicinc.com,
        dianders@chromium.org, linux-clk@vger.kernel.org,
        angelogioacchino.delregno@collabora.com,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/3] clk: qcom: gdsc: Fix the handling of PWRSTS_RET support
Date:   Wed, 01 Feb 2023 19:04:37 +0100
Message-ID: <2619574.X9hSmTKtgW@z3ntu.xyz>
In-Reply-To: <5c2442d3-1f65-9106-2ef4-d6beec159538@quicinc.com>
References: <20220920111517.10407-1-quic_rjendra@quicinc.com> <5897497.lOV4Wx5bFT@g550jk>
 <5c2442d3-1f65-9106-2ef4-d6beec159538@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Montag, 23. J=E4nner 2023 05:30:55 CET Rajendra Nayak wrote:
> On 1/22/2023 5:45 AM, Luca Weiss wrote:
> > Hi Rajendra,
> >=20
> > On Dienstag, 20. September 2022 13:15:15 CET Rajendra Nayak wrote:
> >> GDSCs cannot be transitioned into a Retention state in SW.
> >> When either the RETAIN_MEM bit, or both the RETAIN_MEM and
> >> RETAIN_PERIPH bits are set, and the GDSC is left ON, the HW
> >> takes care of retaining the memory/logic for the domain when
> >> the parent domain transitions to power collapse/power off state.
> >>=20
> >> On some platforms where the parent domains lowest power state
> >> itself is Retention, just leaving the GDSC in ON (without any
> >> RETAIN_MEM/RETAIN_PERIPH bits being set) will also transition
> >> it to Retention.
> >>=20
> >> The existing logic handling the PWRSTS_RET seems to set the
> >> RETAIN_MEM/RETAIN_PERIPH bits if the cxcs offsets are specified
> >> but then explicitly turns the GDSC OFF as part of _gdsc_disable().
> >> Fix that by leaving the GDSC in ON state.
> >>=20
> >> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> >> ---
> >> v3:
> >> Updated changelog
> >>=20
> >> There are a few existing users of PWRSTS_RET and I am not
> >> sure if they would be impacted with this change
> >>=20
> >> 1. mdss_gdsc in mmcc-msm8974.c, I am expecting that the
> >> gdsc is actually transitioning to OFF and might be left
> >> ON as part of this change, atleast till we hit system wide
> >> low power state.
> >> If we really leak more power because of this
> >> change, the right thing to do would be to update .pwrsts for
> >> mdss_gdsc to PWRSTS_OFF_ON instead of PWRSTS_RET_ON
> >> I dont have a msm8974 hardware, so if anyone who has can report
> >> any issues I can take a look further on how to fix it.
> >=20
> > Unfortunately indeed this patch makes problems on msm8974, at least on
> > fairphone-fp2 hardware.
> >=20
> > With this patch in place, the screen doesn't initialize correctly in ma=
ybe
> > 80% of boots and is stuck in weird states, mostly just becomes complete=
ly
> > blue.
> >=20
> > Kernel log at least sometimes includes messages like this:
> > [   25.847541] dsi_cmds2buf_tx: cmd dma tx failed, type=3D0x39, data0=
=3D0x51,
> > len=3D8, ret=3D-110
> >=20
> > Do you have anything I can try on msm8974? For now, reverting this patch
> > makes display work again on v6.1
>=20
> hmm, I was really expecting this to leak more power than break anything
> functionally, Did you try moving to PWRSTS_OFF_ON instead of PWRSTS_RET_ON
> for mdss_gdsc?

Hi Rajendra,

yes with this change the display init works fine again. Do you think this i=
s=20
the intended solution then? I also haven't tested really more than this sim=
ple=20
case.

Let me know what you think.

Regards
Luca

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm897=
4.c
index 26f3f8f06edf..f95e38abde13 100644
=2D-- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2389,7 +2389,7 @@ static struct gdsc mdss_gdsc =3D {
 	.pd =3D {
 		.name =3D "mdss",
 	},
=2D	.pwrsts =3D PWRSTS_RET_ON,
+	.pwrsts =3D PWRSTS_OFF_ON,
 };
=20
 static struct gdsc camss_jpeg_gdsc =3D {


> > Regards
> > Luca
> >=20
> >> 2. gpu_gx_gdsc in gpucc-msm8998.c and
> >>=20
> >>     gpu_gx_gdsc in gpucc-sdm660.c
> >>=20
> >> Both of these seem to add support for 3 power state
> >> OFF, RET and ON, however I dont see any logic in gdsc
> >> driver to handle 3 different power states.
> >> So I am expecting that these are infact just transitioning
> >> between ON and OFF and RET state is never really used.
> >> The ideal fix for them would be to just update their resp.
> >> .pwrsts to PWRSTS_OFF_ON only.
> >>=20
> >>   drivers/clk/qcom/gdsc.c | 10 ++++++++++
> >>   drivers/clk/qcom/gdsc.h |  5 +++++
> >>   2 files changed, 15 insertions(+)
> >>=20
> >> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> >> index d3244006c661..ccf63771e852 100644
> >> --- a/drivers/clk/qcom/gdsc.c
> >> +++ b/drivers/clk/qcom/gdsc.c
> >> @@ -368,6 +368,16 @@ static int _gdsc_disable(struct gdsc *sc)
> >>=20
> >>   	if (sc->pwrsts & PWRSTS_OFF)
> >>   =09
> >>   		gdsc_clear_mem_on(sc);
> >>=20
> >> +	/*
> >> +	 * If the GDSC supports only a Retention state, apart from ON,
> >> +	 * leave it in ON state.
> >> +	 * There is no SW control to transition the GDSC into
> >> +	 * Retention state. This happens in HW when the parent
> >> +	 * domain goes down to a Low power state
> >> +	 */
> >> +	if (sc->pwrsts =3D=3D PWRSTS_RET_ON)
> >> +		return 0;
> >> +
> >>=20
> >>   	ret =3D gdsc_toggle_logic(sc, GDSC_OFF);
> >>   	if (ret)
> >>   =09
> >>   		return ret;
> >>=20
> >> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> >> index 5de48c9439b2..981a12c8502d 100644
> >> --- a/drivers/clk/qcom/gdsc.h
> >> +++ b/drivers/clk/qcom/gdsc.h
> >> @@ -49,6 +49,11 @@ struct gdsc {
> >>=20
> >>   	const u8			pwrsts;
> >>  =20
> >>   /* Powerdomain allowable state bitfields */
> >>   #define PWRSTS_OFF		BIT(0)
> >>=20
> >> +/*
> >> + * There is no SW control to transition a GDSC into
> >> + * PWRSTS_RET. This happens in HW when the parent
> >> + * domain goes down to a low power state
> >> + */
> >>=20
> >>   #define PWRSTS_RET		BIT(1)
> >>   #define PWRSTS_ON		BIT(2)
> >>   #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)





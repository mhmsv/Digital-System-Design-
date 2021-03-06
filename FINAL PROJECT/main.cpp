#include "HLS/hls.h"
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
using namespace ihc;

const char str[8995]= "(CNN) The United States just recorded more than 77,000 new cases of Covid-19, the most ever in a single day. But President Donald Trump wants to talk about dishwasher reform. Trump's refusal to use his full powers of his office and the government to confront the worst domestic threat since World War II is looking more negligent, callous and politically self-defeating with each virus ravaged day that passes. Not only is Trump refusing to act in a manner appropriate to the magnitude of the emergency, he is using the country's loudest megaphone in a way almost guaranteed to make it worse, from presiding over a White House campaign to discredit the lifelong work of Dr. Anthony Fauci -- a new front in his war on science and truth -- to undermining efforts by local officials to convince people to wear masks to slow the spread of the disease. Trump's intransigence is more notable since he's happy to use presidential power -- often in an anti-constitutional way -- in pursuit of personal and political gain. For instance, in coercing Ukraine to interfere in the election and in commuting the jail term of his political dirty trickster Roger Stone. This week, as states such as Florida, Texas and Arizona have set records for coronavirus infections and intensive care units and morgues have filled up, has exposed the willful blindness of a White House that seems bio-sealed from the reality of the pandemic. \"We believe this President has great approval in this country. His historic Covid response speaks for itself,\" White House press secretary Kayleigh McEnany said Thursday, encapsulating the bizarre parallel universe of an administration that thinks one of the most disastrous government failures of the modern age is a roaring political success.McEnany on Thursday praised US testing and the push for vaccines and therapeutics -- which have as much to do with the innovation of the US pharmaceutical industry as anything Trump has done. The US still lacks a functioning national test and trace program, still cannot properly equip all medical workers with protective gear and is losing badly to the virus five months into the fight.His aides celebrate his decision to halt travel to some travelers from China and for prioritizing the manufacture of ventilators months ago. Such steps were important, but with hindsight have proven less significant than they appeared at the time. More importantly they are doing little to quell the vicious resurgence of the virus across most of the country. And boasting about ventilators seems perverse when thousands of Americans are dying anyway.\"The President has made so many bad executive decisions,\" House Speaker Nancy Pelosi, D-California, said Thursday.\"Observing his behavior, I have concluded that he is like the man who refuses to ask for directions. All of the answers are there. The scientists have the answers. We know that testing, tracing, treating, distancing, masking, sanitation can stop the spread of this virus. And yet the President continues to go dThe disaster in the US is perhaps best expressed in comparison to other industrialized nations. States such as South Korea suffocated the virus with aggressive measures while Trump was still denying its threat. France and Italy suffered terribly, but science-based lockdowns kept in place until the pathogen was suppressed -- unlike the premature state openings demanded by Trump -- worked. Aggressive foreign governments from Australia to Hong Kong to Germany now pounce on outbreaks in a bid to forestall a major resurgence.France, with a population of 67 million, reported 534 new cases of Covid-19 on Thursday and 18 new deaths. Florida, where 21 million live, put up 13,965 new cases and a new record of 156 deaths on a day its pro-Trump Gov. Ron DeSantis blamed the media for the virus running out of control.Another Trump acolyte, Georgia  Republican Gov.Brian Kemp, issued an executive order late Wednesday blocking the Peach State's cities from issuing orders requiring masks to be worn in public places -- a measure proven to decrease virus transmission -- and on Thursday sued Atlanta Mayor Keisha Lance Bottoms for sticking by her city's mask order.\"How can you not shake your head, right? Over 3 million cases, over 135,000 deaths, preventable deaths here in the United States,\" said Dr. Ali Khan, dean of the College of Public Health at the University of Nebraska Medical Center on CNN's \"New Day\" Thursday. \"And we are the one outlier amongst all of our peer countries. All of Europe has contained their disease. And many parts of the world, not only have they contained, they've eliminated disease.\"The President, however, turned his gaze away from this worsening calamity and international embarrassment. He rarely mentions the virus in public, unless it is to deny its awful reality. The President never appears with his public health officials and gives every impression that he has moved on. On Thursday, he gathered Cabinet members and Republican lawmakers in the White House to celebrate the eradication of more \"job killing regulations.\"\"We made it so dishwashers now have a lot more water and in many places -- in most places of the country, water\'s not a problem, they don\'t know what to do with it. It\'s called rain. They don\'t have a problem,\" Trump said, at an event in which various guests were called to the microphone by a genuflecting Vice President Mike Pence to pay tribute to his \"leadership.\"Trump\'s event came a day after he flew to Atlanta, one of the spiking coronavirus hotspots, not for emergency brainstorming sessions at the conveniently situated US Centers for Disease Control and Prevention, but for an event on transportation projects.With the country on its knees because of the virus, which is now rising in 38 states, the White House is filling Trump\'s day with the kind of low wattage, incremental events meant to highlight an agenda typical of times when Presidents run out of political clout.\"He\'s doing a lot of things at once,\" she said. \"That\'s the great thing about the Trump administration,\" McEnany said.While ignoring the worsening national crisis, Trump has also found time to shake-up his reelection campaign, as the former chief, Brad Parscale, paid the price for the debacle and low crowd at what was supposed to be the President's triumphant return to the campaign trail in Oklahoma.Despite the frantic remodeling less than four months before election day, Trump claimed that opinion polls showing him trailing Democratic presumptive nominee Joe Biden by double digits were all fiction. While refusing to take the pandemic seriously, Trump turned the Resolute Desk in the Oval Office into a market stall for Goya products, after the firm's CEO faced a backlash for praising him. His daughter Ivanka showed her political tin ear by launching a program that urges millions of people who lost jobs in the pandemic their father ignored to \"find something new.\" own the wrong path and refuses to ask for directions from scientists who know better than any of us.The staggering negligence of the White House and apparent obliviousness to the tragedy unfolding on Trump's watch are remarkable in that there appears now to be little expectation from governors or public health experts that leadership to protect Americans -- the fundamental duty of a President during a national crisis -- will ever be forthcoming.\"We expected something more than constant heckling from the man who was supposed to be our leader,\" Maryland's Republican Gov. Larry Hogan wrote in a devastating opinion piece in The Washington Post on Thursday.\"Trump soon disabused us of that expectation.\"The administration's push to open schools fully and full time has emerged this week as an emblem of its myopia and of the way that local and state officials are making decisions -- in this case preparing for online classes only -- that ignore demands by Trump that are clearly more motivated by his own political requirements than concern for safety.McEnany claimed that scientific research proved that children were far less likely to become infected by the coronavirus and to have serious complications, so therefore schools must reopen. But her point ignores the serious concerns that teachers, administrative staff and ancillary workers like janitors and security guards in close contact with children could be at a high risk of illness in confined spaces. And while kids may not get sick, they can infect older and more vulnerable relatives at home.\"Everyone else in the Western world, our peer nations, are doing it. We are the outlier here,\" McEnany said, ignoring the obvious point that the rest of the Western world benefits from leaders who brought the pandemic under control.\"The science should not stand in the way of this,\" she said, in a comment that encapsulates Trump\'s entire, failed approach to the crisis.This story has been updated with the latest data on coronavirus cases.";
component int match_str(char sub[64])
{
    //int size = strlen( str );//len of data
    int starting_idx; // idx of ans if there is one
    int count=0;// if it reaches 63 ,we have substring in the string
   
    for (int i = 0;i<8995; i++)
    {
        for (int j = 0; j<63; j++)
        {
            if(sub[j] == str[i + j])
            {
                //if (count>10)
                //cout<<count<<endl;
                count+=1;
            }
            else
                count=0;//restore to default
        }
        if (count==63)
            return i;
    }
    return -1;
}


int main()
{
    //vorodi ro kheily zesht midahim bejaye file
    

    
    
    //char str[] = "eshak String1 subString1 Strinstrnd subStr ing1subString subString";
    //string str
    //reading from file and copying into str
    
    //file khooondan ghadumi
    //    FILE *filePointer;
    //    char ch;
    //
    //    filePointer = fopen("/Users/mohamad/Desktop/hlsexample/hlsexample/cnn.txt", "r");
    //
    //    if (filePointer == NULL)
    //    {
    //        printf("File is not available \n");
    //    }
    //    else
    //    {
    //        while ((ch = fgetc(filePointer)) != EOF)
    //        {
    //            printf("%c", ch);
    //
    //        }
    //    }
    
  
    char sub[65] = "Trump's intransigence is more notable since he's happy to use pr";

    //caling match_str
    int result=match_str(sub);

    if (result==-1)
        printf("Failed!");
    else
        printf("starting index : %d \n PASSED",result);


    //cloosing file
    //fclose(filePointer);
    return 0;
}

